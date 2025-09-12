import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuko_application/models/image_file';
import '../auth/auth_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      AuthCubit.get(context).checkLoggedInUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: GoogleFonts.fredoka(color: Colors.black)),
        flexibleSpace: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthAuthenticated) {
            final user = state.userData;

            print("IMAGE PATH: ${user?['imagePath']}"); // Debug

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        (user?['imagePath'] != null &&
                            user!['imagePath'].isNotEmpty)
                        ? FileImage(File(user['imagePath']))
                        : const AssetImage("assets/profile.png")
                              as ImageProvider,
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton.icon(
                    onPressed: () async {
                      final newPath = await ImageService.pickAndSaveImage();
                      if (newPath != null) {
                        AuthCubit.get(context).updateUserImage(newPath);
                      }
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("Change Photo"),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    user?['name'] ?? "Unknown User",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    user?['email'] ?? "",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.clear();
                      AuthCubit.get(context).logout();
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                  ),
                ],
              ),
            );
          } else if (state is AuthError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: Text("No user logged in"));
          }
        },
      ),
    );
  }
}
