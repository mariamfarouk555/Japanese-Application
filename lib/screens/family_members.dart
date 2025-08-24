import 'package:flutter/material.dart';
import 'package:project/components/item.dart';
//import 'package:toku/components/item.dart';
import '../models/number.dart';

class FamilyMembersPage extends StatelessWidget {
  FamilyMembersPage({super.key});

  final List<Number> numbers = [
    Number(
      image: 'assets/images/family_members/family_father.png',
      sound: 'sounds/family_members/father.wav',
      jpName: 'Chichioya',
      enName: 'father',
    ),
    Number(
      image: 'assets/images/family_members/family_daughter.png',
      sound: 'sounds/family_members/daughter.wav',
      jpName: 'Musume',
      enName: 'daughter',
    ),
    Number(
      image: 'assets/images/family_members/family_grandfather.png',
      sound: 'sounds/family_members/grandfather.mp3.wav',
      jpName: 'Ojisan',
      enName: 'grand father',
    ),
    Number(
      image: 'assets/images/family_members/family_mother.png',
      sound: 'sounds/family_members/mother.wav',
      jpName: 'Hahaoya',
      enName: 'mother',
    ),
    Number(
      image: 'assets/images/family_members/family_grandmother.png',
      sound: 'sounds/family_members/grandmother.mp3.wav',
      jpName: 'Sobo',
      enName: 'grand mother',
    ),
    Number(
      image: 'assets/images/family_members/family_older_brother.png',
      sound: 'sounds/family_members/olderbother.mp3.wav',
      jpName: 'Nisan',
      enName: 'older brother',
    ),
    Number(
      image: 'assets/images/family_members/family_older_sister.png',
      sound: 'sounds/family_members/oldersister.mp3.wav',
      jpName: 'Ane',
      enName: 'older sister',
    ),
    Number(
      image: 'assets/images/family_members/family_son.png',
      sound: 'sounds/family_members/son.wav',
      jpName: 'Musuko',
      enName: 'son',
    ),
    Number(
      image: 'assets/images/family_members/family_younger_brother.png',
      sound: 'sounds/family_members/youngerbrohter.mp3.wav',
      jpName: 'ototo',
      enName: 'yonger brother',
    ),
    Number(
      image: 'assets/images/family_members/family_younger_sister.png',
      sound: 'sounds/family_members/youngersister.mp3.wav',
      jpName: 'imoto',
      enName: 'younger sister',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF49332A),
        title: const Text(
          'Family Members',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Item(
            sound: numbers[index].sound,
            color: const Color(0xff5D8B3E),
            number: numbers[index],
          );
        },
      ),
    );
  }

  // List<Widget> getList(List<Number> numbers) {
  //   List<item> itemList = [];
  //   for (int i = 0; i < numbers.length; i++) {
  //     itemList.add(item(number: numbers[i]));
  //   }

  //   return itemList;
  // }
}
