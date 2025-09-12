import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuko_application/models/inputitem.dart';
import 'package:tuko_application/models/item.dart';


  class ColorsPage extends StatelessWidget {
     ColorsPage({super.key});

  final AudioPlayer player = AudioPlayer();

  final List<InputItem> colors = [
    InputItem(
      image: 'assets/images/colors/color_black.png',
      sound: 'sounds/colors/black.wav',
      jpName: 'kuroi',
      enName: 'Black',
    ),
    InputItem(
      image: 'assets/images/colors/color_brown.png',
      sound: 'sounds/colors/brown.wav',
      jpName: 'kasshoku',
      enName: 'Brown',
    ),
    InputItem(
      image: 'assets/images/colors/color_dusty_yellow.png',
      sound: 'sounds/colors/dusty yellow.wav',
      jpName: 'oi kiiro',
      enName: 'Dusty Yellow',
    ),
    InputItem(
      image: 'assets/images/colors/color_gray.png',
      sound: 'sounds/colors/gray.wav',
      jpName: 'haiiro',
      enName: 'Gray',
    ),
    InputItem(
      image: 'assets/images/colors/color_green.png',
      sound: 'sounds/colors/green.wav',
      jpName: 'midori',
      enName: 'Green',
    ),
    InputItem(
      image: 'assets/images/colors/color_red.png',
      sound: 'sounds/colors/red.wav',
      jpName: 'akai',
      enName: 'Red',
    ),
    InputItem(
      image: 'assets/images/colors/color_white.png',
      sound: 'sounds/colors/white.wav',
      jpName: 'shiroi',
      enName: 'White',
    ),
    InputItem(
      image: 'assets/images/colors/yellow.png',
      sound: 'sounds/colors/yellow.wav',
      jpName: 'kiiro',
      enName: 'Yellow',
    ),
  ];
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F4F9),
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        title:  Text(
          'Colors',
            style: GoogleFonts.fredoka(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
       
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Item(
            image: colors[index].image,
            enName: colors[index].enName,
            jpName: colors[index].jpName,
            sound: colors[index].sound,
            color: Colors.white,
            player: player,
          );
        },
      ),
    );
  }
}