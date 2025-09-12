import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuko_application/Screens/homepage.dart';
import 'package:tuko_application/auth/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  File? _pickedImage;

  final Color primaryColor = const Color(0xFFC559B0);

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _loading = true;
    });

    await AuthCubit.get(context).registerUser(
      _emailController.text.trim(),
      _nameController.text.trim(),
      _passwordController.text.trim(),
      _pickedImage?.path,
    );

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is AuthAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white24,
                      backgroundImage: _pickedImage != null
                          ? FileImage(_pickedImage!)
                          : const AssetImage("assets/logo.png")
                                as ImageProvider,
                      child: _pickedImage == null
                          ? const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                              size: 28,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0x8183FDFF),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Join us and start learning Japanese",
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
                              controller: _nameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: primaryColor,
                                ),
                                labelText: "Name",
                                labelStyle: TextStyle(color: primaryColor),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter your name' : null,
                            ),
                            const SizedBox(height: 15),
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
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter your email' : null,
                            ),
                            const SizedBox(height: 15),
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
                              validator: (value) =>
                                  value!.isEmpty ? 'Enter your password' : null,
                            ),
                            const SizedBox(height: 25),
                            _loading
                                ? CircularProgressIndicator(color: primaryColor)
                                : ElevatedButton(
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
                                    onPressed: _register,
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
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
                    "By creating an account you agree to our Terms & Conditions",
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
