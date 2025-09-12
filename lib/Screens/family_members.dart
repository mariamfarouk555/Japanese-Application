import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuko_application/models/inputitem.dart';
import 'package:tuko_application/models/item.dart';


class FamilyMembers extends StatelessWidget {
  FamilyMembers({super.key});

  final AudioPlayer player = AudioPlayer();

  final List<InputItem> familymembers = [
    InputItem(
      image: 'assets/images/family_members/family_father.png',
      sound: 'sounds/family_members/father.wav',
      jpName: 'Chichioya',
      enName: 'Father',
    ),
    InputItem(
      image: 'assets/images/family_members/family_daughter.png',
      sound: 'sounds/family_members/daughter.wav',
      jpName: 'Musume',
      enName: 'Daughter',
    ),
    InputItem(
      image: 'assets/images/family_members/family_grandfather.png',
      sound: 'sounds/family_members/grandfather.mp3.wav',
      jpName: 'Ojisan',
      enName: 'Grand Father',
    ),
    InputItem(
      image: 'assets/images/family_members/family_mother.png',
      sound: 'sounds/family_members/mother.wav',
      jpName: 'Hahaoya',
      enName: 'Mother',
    ),
    InputItem(
      image: 'assets/images/family_members/family_grandmother.png',
      sound: 'sounds/family_members/grandmother.mp3.wav',
      jpName: 'Sobo',
      enName: 'Grand Mother',
    ),
    InputItem(
      image: 'assets/images/family_members/family_older_brother.png',
      sound: 'sounds/family_members/olderbother.mp3.wav',
      jpName: 'Nisan',
      enName: 'Older Brother',
    ),
    InputItem(
      image: 'assets/images/family_members/family_older_sister.png',
      sound: 'sounds/family_members/oldersister.mp3.wav',
      jpName: 'Ane',
      enName: 'Older Sister',
    ),
    InputItem(
      image: 'assets/images/family_members/family_son.png',
      sound: 'sounds/family_members/son.wav',
      jpName: 'Musuko',
      enName: 'Son',
    ),
    InputItem(
      image: 'assets/images/family_members/family_younger_brother.png',
      sound: 'sounds/family_members/youngerbrohter.mp3.wav',
      jpName: 'Ototo',
      enName: 'Younger Brother',
    ),
    InputItem(
      image: 'assets/images/family_members/family_younger_sister.png',
      sound: 'sounds/family_members/youngersister.mp3.wav',
      jpName: 'Imoto',
      enName: 'Younger Sister',
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
          'Family Members',
            style: GoogleFonts.fredoka(
            color: const Color.fromARGB(200, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
       
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: familymembers.length,
        itemBuilder: (context, index) {
          return Item(
            image: familymembers[index].image,
            enName: familymembers[index].enName,
            jpName: familymembers[index].jpName,
            sound: familymembers[index].sound,
            color: Colors.white,
            player: player,
          );
        },
      ),
    );
  }
}