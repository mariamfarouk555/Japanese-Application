import 'package:flutter/material.dart';
import 'package:project/Screens/colors_page.dart';
import 'package:project/Screens/family_members.dart';
import 'package:project/Screens/numbers_page.dart';
import 'package:project/Screens/phrases_page.dart';
import 'package:project/components/category.dart';
// import 'package:toku/Screens/colors_page.dart';
// import 'package:toku/Screens/family_members.dart';
// import 'package:toku/Screens/numbers_page.dart';
// import 'package:toku/Screens/phrases_page.dart';
// import 'package:toku/components/category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4D9),
      appBar: AppBar(
        backgroundColor: const Color(0XFF49332A),
        title: const Text('Toku', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Category(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NumbersPage();
                  },
                ),
              );
            },
            text: 'Numbers',
            color: const Color(0xffFF9F3B),
          ),
          Category(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return FamilyMembersPage();
                  },
                ),
              );
            },
            text: 'Family Members',
            color: const Color(0xff5D8B3E),
          ),
          Category(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ColorsPage();
                  },
                ),
              );
            },
            text: 'Colors',
            color: const Color(0xff854CAE),
          ),
          Category(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PhrasesPage();
                  },
                ),
              );
            },
            text: 'Phrases',
            color: const Color(0xff51B0D5),
          ),
        ],
      ),
    );
  }
}
