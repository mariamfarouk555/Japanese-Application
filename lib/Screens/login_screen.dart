import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuko_application/Screens/homepage.dart';
import 'package:tuko_application/Screens/register_screen.dart';
import 'package:tuko_application/auth/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Color primaryColor = const Color(0xFFC559B0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthAuthenticated) {
            final prefs = await SharedPreferences.getInstance();

            await prefs.setBool("loggedIn", true);
            await prefs.setString("userEmail", _emailController.text.trim());
            await prefs.setString(
              "userPassword",
              _passwordController.text.trim(),
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/logo.png"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome to Tuko App",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0x8183FDFF),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Learn Japanese interactively",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                    shadowColor: primaryColor.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: primaryColor,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: primaryColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: primaryColor,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: primaryColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot password?",
                                    style: TextStyle(color: Colors.red[400]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await AuthCubit.get(context).loginUser(
                                    _emailController.text.trim(),
                                    _passwordController.text.trim(),
                                  );
                                }
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "By logging in you agree to our Terms & Conditions",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
