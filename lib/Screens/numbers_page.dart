import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:tuko_application/models/inputitem.dart';
import 'package:tuko_application/models/item.dart';
import 'package:google_fonts/google_fonts.dart';

class NumbersPage extends StatelessWidget {
  NumbersPage({super.key});

  final AudioPlayer player = AudioPlayer();
  final List<InputItem> numbers = [
    InputItem(
      image: 'assets/images/numbers/number_one.png',
      sound: 'sounds/numbers/number_one_sound.mp3',
      jpName: 'ichi',
      enName: 'One',
    ),
    InputItem(
      image: 'assets/images/numbers/number_two.png',
      sound: 'sounds/numbers/number_two_sound.mp3',
      jpName: 'ni',
      enName: 'Two',
    ),
    InputItem(
      image: 'assets/images/numbers/number_three.png',
      sound: 'sounds/numbers/number_three_sound.mp3',
      jpName: 'san',
      enName: 'Three',
    ),
    InputItem(
      image: 'assets/images/numbers/number_four.png',
      sound: 'sounds/numbers/number_four_sound.mp3',
      jpName: 'yon',
      enName: 'Four',
    ),
    InputItem(
      image: 'assets/images/numbers/number_five.png',
      sound: 'sounds/numbers/number_five_sound.mp3',
      jpName: 'go',
      enName: 'Five',
    ),
    InputItem(
      image: 'assets/images/numbers/number_six.png',
      sound: 'sounds/numbers/number_six_sound.mp3',
      jpName: 'roku',
      enName: 'Six',
    ),
    InputItem(
      image: 'assets/images/numbers/number_seven.png',
      sound: 'sounds/numbers/number_seven_sound.mp3',
      jpName: 'nana',
      enName: 'Seven',
    ),
    InputItem(
      image: 'assets/images/numbers/number_eight.png',
      sound: 'sounds/numbers/number_eight_sound.mp3',
      jpName: 'hachi',
      enName: 'Eight',
    ),
    InputItem(
      image: 'assets/images/numbers/number_nine.png',
      sound: 'sounds/numbers/number_nine_sound.mp3',
      jpName: 'kyu',
      enName: 'Nine',
    ),
    InputItem(
      image: 'assets/images/numbers/number_ten.png',
      sound: 'sounds/numbers/number_ten_sound.mp3',
      jpName: 'ju',
      enName: 'Ten',
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
          'Numbers',
            style: GoogleFonts.fredoka(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
       
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Item(
            image: numbers[index].image,
            enName: numbers[index].enName,
            jpName: numbers[index].jpName,
            sound: numbers[index].sound,
            color: Colors.white,
            player: player,
          );
        },
      ),
    );
  }
}
