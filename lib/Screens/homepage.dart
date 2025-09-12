import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuko_application/Screens/about.dart';
import 'package:tuko_application/Screens/login_screen.dart';
import 'package:tuko_application/Screens/numbers_page.dart';
import 'package:tuko_application/Screens/profile.dart';
import 'package:tuko_application/Screens/quizzes_page.dart';
import 'package:tuko_application/Screens/phrases.dart';
import 'package:intl/intl.dart';
import 'package:tuko_application/Screens/settings_screen.dart';

import 'package:tuko_application/auth/auth_cubit.dart';
import 'colors_page.dart';
import 'family_members.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const AboutPage(),
    const ProfilePage(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // يقلل التطبيق بدل الخروج
        SystemNavigator.pop();
        return false; // يمنع أي سلوك افتراضي آخر
      },
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? AppBar(
                title: Text(
                  'Tuko',
                  style: GoogleFonts.fredoka(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                elevation: 0,
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.indigo, Colors.purple],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      AuthCubit.get(context).logout();
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              )
            : null,
        drawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFC559B0), Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFC559B0), Colors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  accountName: const Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: const Text("Let's learn Japanese 🇯🇵"),
                  currentAccountPicture: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      String? imageUrl;
                      if (state is AuthAuthenticated) {
                        imageUrl = state.userData?['imagePath'];
                      }

                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            (imageUrl != null && imageUrl.isNotEmpty)
                            ? FileImage(File(imageUrl))
                            : const AssetImage("assets/profile.png")
                                  as ImageProvider,
                      );
                    },
                  ),
                ),
                _buildDrawerItem(
                  icon: Icons.home,
                  text: "Home",
                  onTap: () {
                    setState(() => _selectedIndex = 0);
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.info,
                  text: "About",
                  onTap: () {
                    setState(() => _selectedIndex = 1);
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.person,
                  text: "Profile",
                  onTap: () {
                    setState(() => _selectedIndex = 2);
                    Navigator.pop(context);
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.settings,
                  text: "Settings",
                  onTap: () {
                    setState(() => _selectedIndex = 3);
                    Navigator.pop(context);
                  },
                ),
                const Divider(color: Colors.white54, thickness: 0.8),
                ListTile(
                  leading: const Icon(Icons.exit_to_app, color: Colors.red),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove("loggedIn");

                    AuthCubit.get(context).logout();

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.purple,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}

// Dashboard
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEEE').format(DateTime.now());
    String time = DateFormat('hh:mm a').format(DateTime.now());

    String getGreeting() {
      int hour = DateTime.now().hour;
      if (hour >= 5 && hour < 12) {
        return "Good Morning";
      } else if (hour >= 12 && hour < 17) {
        return "Good Afternoon";
      } else if (hour >= 17 && hour < 21) {
        return "Good Evening";
      } else {
        return "Good Night";
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      String userName = "";
                      if (state is AuthAuthenticated) {
                        userName = state.userData?['name'] ?? "";
                      }

                      return Text(
                        "${getGreeting()} $userName",
                        style: GoogleFonts.manrope(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(width: 8),
              const WavingHand(),
            ],
          ),
          const SizedBox(height: 8),
          Text("Today is $day", style: GoogleFonts.roboto(fontSize: 18)),
          Text("$time", style: GoogleFonts.roboto(fontSize: 18)),
          const Divider(color: Colors.grey, thickness: 0.5),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildCategoryCard(
                  context,
                  title: "Numbers",
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE3B5E7), Color(0xFFF684C5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: "assets/numbers.png",
                  page: NumbersPage(),
                ),
                _buildCategoryCard(
                  context,
                  title: "Family",
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE3B5E7), Color(0xFFF684C5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: "assets/familymembers.png",
                  page: FamilyMembers(),
                ),
                _buildCategoryCard(
                  context,
                  title: "Colors",
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE3B5E7), Color(0xFFF684C5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: "assets/colors.png",
                  page: ColorsPage(),
                ),
                _buildCategoryCard(
                  context,
                  title: "Phrases",
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE3B5E7), Color(0xFFF684C5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  image: "assets/phrases.png",
                  page: Phrases(),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFC559B0), Color(0xFFC559B0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(80),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.quiz, color: Colors.white, size: 30),
                  const SizedBox(width: 12),
                  Text(
                    "Quizzes",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuizzesPage()),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required LinearGradient gradient,
    required String image,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => page,
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: title, child: Image.asset(image, width: 60, height: 60)),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WavingHand extends StatefulWidget {
  const WavingHand({super.key});

  @override
  _WavingHandState createState() => _WavingHandState();
}

class _WavingHandState extends State<WavingHand>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: -0.1, end: 0.1).animate(_controller),
      child: const Text("👋", style: TextStyle(fontSize: 28)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
