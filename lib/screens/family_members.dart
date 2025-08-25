import 'package:flutter/material.dart';
import '../screens/number.dart';
import 'package:audioplayers/audioplayers.dart';

class FamilyMembersPage extends StatelessWidget {
  FamilyMembersPage({super.key});

  final AudioPlayer player = AudioPlayer();

  final List<Number> numbers = [
    Number(
      image: 'assets/images/family_members/family_father.png',
      sound: 'sounds/family_members/father.wav',
      jpName: 'Chichioya',
      enName: 'Father',
    ),
    Number(
      image: 'assets/images/family_members/family_daughter.png',
      sound: 'sounds/family_members/daughter.wav',
      jpName: 'Musume',
      enName: 'Daughter',
    ),
    Number(
      image: 'assets/images/family_members/family_grandfather.png',
      sound: 'sounds/family_members/grandfather.mp3.wav',
      jpName: 'Ojisan',
      enName: 'Grand Father',
    ),
    Number(
      image: 'assets/images/family_members/family_mother.png',
      sound: 'sounds/family_members/mother.wav',
      jpName: 'Hahaoya',
      enName: 'Mother',
    ),
    Number(
      image: 'assets/images/family_members/family_grandmother.png',
      sound: 'sounds/family_members/grandmother.mp3.wav',
      jpName: 'Sobo',
      enName: 'Grand Mother',
    ),
    Number(
      image: 'assets/images/family_members/family_older_brother.png',
      sound: 'sounds/family_members/olderbother.mp3.wav',
      jpName: 'Nisan',
      enName: 'Older Brother',
    ),
    Number(
      image: 'assets/images/family_members/family_older_sister.png',
      sound: 'sounds/family_members/oldersister.mp3.wav',
      jpName: 'Ane',
      enName: 'Older Sister',
    ),
    Number(
      image: 'assets/images/family_members/family_son.png',
      sound: 'sounds/family_members/son.wav',
      jpName: 'Musuko',
      enName: 'Son',
    ),
    Number(
      image: 'assets/images/family_members/family_younger_brother.png',
      sound: 'sounds/family_members/youngerbrohter.mp3.wav',
      jpName: 'Ototo',
      enName: 'Younger Brother',
    ),
    Number(
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
        backgroundColor: const Color(0XFF49332A),
        title: const Text(
          'Family Members',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  numbers[index].image,
                  width: 55,
                  height: 55,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                numbers[index].enName,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff49332A)),
              ),
              subtitle: Text(
                numbers[index].jpName,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              trailing: IconButton(
                onPressed: () {
                  player.play(AssetSource(numbers[index].sound));
                },
                icon: const Icon(Icons.play_circle_fill,
                    color: Color(0xff5D8B3E), size: 35),
              ),
            ),
          );
        },
      ),
    );
  }
}
