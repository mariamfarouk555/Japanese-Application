import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuko_application/Screens/homepage.dart';
import 'package:tuko_application/Screens/login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _navigateUser();
  }

  Future<void> _navigateUser() async {
    await Future.delayed(const Duration(seconds: 5));

    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool("loggedIn") ?? false;

    if (!mounted) return;

    if (loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: Image.asset("assets/logo.png", width: 300, height: 300),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeTransition(
                      opacity: _animation,
                      child: Text(
                        "Tuko",
                        style: GoogleFonts.fredoka(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: const Color(0x8183FDFF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeTransition(
                      opacity: _animation,
                      child: Text(
                        "日本語を一歩ずつ学ぼう",
                        style: GoogleFonts.fredoka(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
