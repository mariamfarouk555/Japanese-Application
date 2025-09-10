import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  Future<void> registerUser(
    String email,
    String name,
    String password,
    String? imagePath,
  ) async {
    try {
      emit(AuthLoading());

      if (email.isEmpty || !email.contains('@')) {
        emit(AuthError('Please enter a valid email.'));
        return;
      }

      if (password.length < 6) {
        emit(AuthError('Password must be at least 6 characters.'));
        return;
      }

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final Map<String, dynamic> firestoreData = {
        'uid': userCredential.user!.uid,
        'name': name,
        'email': email,
        'imagePath': imagePath ?? "",
        'createdAt': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(firestoreData);

      final Map<String, dynamic> userData = {
        'uid': userCredential.user!.uid,
        'name': name,
        'email': email,
        'imagePath': imagePath ?? "",
      };

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool("loggedIn", true);
      await prefs.setString("uid", userData["uid"]);
      await prefs.setString("name", userData["name"]);
      await prefs.setString("email", userData["email"]);
      await prefs.setString("imagePath", userData["imagePath"]);

      emit(AuthAuthenticated(userData));
    } on FirebaseAuthException catch (error) {
      emit(AuthError(error.message ?? "Registration failed"));
    } catch (e) {
      emit(AuthError("An unexpected error occurred during registration."));
    }
  }

  // Login user
  Future<void> loginUser(String email, String password) async {
    try {
      emit(AuthLoading());

      if (email.isEmpty || password.isEmpty) {
        emit(AuthError('Email and password cannot be empty.'));
        return;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;
      DocumentSnapshot doc = await _firestore
          .collection("users")
          .doc(uid)
          .get();

      if (doc.exists && doc.data() != null) {
        final firestoreData = doc.data() as Map<String, dynamic>;

        final userData = {
          "uid": uid,
          "name": firestoreData["name"],
          "email": firestoreData["email"],
          "imagePath": firestoreData["imagePath"] ?? "",
        };

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool("loggedIn", true);
        await prefs.setString("uid", uid);
        await prefs.setString("name", userData["name"]);
        await prefs.setString("email", userData["email"]);
        await prefs.setString("imagePath", userData["imagePath"]);

        emit(AuthAuthenticated(userData));
      } else {
        emit(AuthError("Your profile could not be loaded."));
      }
    } on FirebaseAuthException catch (error) {
      emit(AuthError(error.message ?? "Login failed"));
    } catch (e) {
      emit(AuthError("An unexpected error occurred during login."));
    }
  }

  Future<void> checkLoggedInUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final loggedIn = prefs.getBool("loggedIn") ?? false;

      if (loggedIn) {
        final userData = {
          "uid": prefs.getString("uid") ?? "",
          "name": prefs.getString("name") ?? "Unknown User",
          "email": prefs.getString("email") ?? "",
          "imagePath": prefs.getString("imagePath") ?? "",
        };

        emit(AuthAuthenticated(userData));
      } else {
        emit(AuthLoggedOut());
      }
    } catch (e) {
      emit(AuthError("Error checking login status: $e"));
    }
  }

  // Logout user
  Future<void> logout() async {
    await _auth.signOut();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    emit(AuthLoggedOut());
  }
}
