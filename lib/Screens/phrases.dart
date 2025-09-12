import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuko_application/models/inputitem.dart';
import 'package:tuko_application/models/item.dart';


class Phrases extends StatelessWidget {
  Phrases({super.key});

  final AudioPlayer player = AudioPlayer();

  final List<InputItem> phrases= [
    InputItem(
      sound: 'sounds/phrases/what_is_your_name.wav',
      jpName: 'anata no namae wa nani desu ka',
      enName: 'What is your name',
    ),
    InputItem(
      sound: 'sounds/phrases/how_are_you_feeling.wav',
      jpName: 'choushi wa dou desu ka',
      enName: 'How are you feeling',
    ),
    InputItem(
      sound: 'sounds/phrases/where_are_you_going.wav',
      jpName: 'doko ni ikiba masu ka',
      enName: 'Where are you going',
    ),
    InputItem(
      sound: 'sounds/phrases/are_you_coming.wav',
      jpName: 'rai te i masu ka',
      enName: 'Are you coming',
    ),
    InputItem(
      sound: 'sounds/phrases/yes_im_coming.wav',
      jpName: 'hai, rai te i masu',
      enName: 'Yes, I am coming',
    ),
    InputItem(
      sound: 'sounds/phrases/i_love_anime.wav',
      jpName: 'anime ga daisuki',
      enName: 'I love anime',
    ),
    InputItem(
      sound: 'sounds/phrases/programming_is_easy.wav',
      jpName: 'programming wa kantan',
      enName: 'Programming is easy',
    ),
    InputItem(
      sound: 'sounds/phrases/i_love_programming.wav',
      jpName: 'programming ga daisuki',
      enName: 'I love programming',
    ),
    InputItem(
      sound: 'sounds/phrases/dont_forget_to_subscribe.wav',
      jpName: 'o wasure naku t koudoku',
      enName: 'Do not forget to subscribe',
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
          'Phrases',
            style: GoogleFonts.fredoka(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
       
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return Item(
            image: phrases[index].image,
            enName: phrases[index].enName,
            jpName: phrases[index].jpName,
            sound: phrases[index].sound,
            color: Colors.white,
            player: player,
          );
        },
      ),
    );
  }
}