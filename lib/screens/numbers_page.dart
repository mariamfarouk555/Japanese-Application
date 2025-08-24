import 'package:flutter/material.dart';
import 'package:project/components/item.dart';
import '../screens/number.dart';

class NumbersPage extends StatelessWidget {
  NumbersPage({super.key});

  final List<Number> numbers = [
    Number(
      image: 'assets/images/numbers/number_one.png',
      sound: 'sounds/numbers/number_one_sound.mp3',
      jpName: 'ichi',
      enName: 'one',
    ),
    Number(
      image: 'assets/images/numbers/number_two.png',
      sound: 'sounds/numbers/number_two_sound.mp3',
      jpName: 'ni',
      enName: 'two',
    ),
    Number(
      image: 'assets/images/numbers/number_three.png',
      sound: 'sounds/numbers/number_three_sound.mp3',
      jpName: 'san',
      enName: 'three',
    ),
    Number(
      image: 'assets/images/numbers/number_four.png',
      sound: 'sounds/numbers/number_four_sound.mp3',
      jpName: 'yon',
      enName: 'four',
    ),
    Number(
      image: 'assets/images/numbers/number_five.png',
      sound: 'sounds/numbers/number_five_sound.mp3',
      jpName: 'go',
      enName: 'five',
    ),
    Number(
      image: 'assets/images/numbers/number_six.png',
      sound: 'sounds/numbers/number_six_sound.mp3',
      jpName: 'roku',
      enName: 'six',
    ),
    Number(
      image: 'assets/images/numbers/number_seven.png',
      sound: 'sounds/numbers/number_seven_sound.mp3',
      jpName: 'nana',
      enName: 'seven',
    ),
    Number(
      image: 'assets/images/numbers/number_eight.png',
      sound: 'sounds/numbers/number_eight_sound.mp3',
      jpName: 'hachi',
      enName: 'eight',
    ),
    Number(
      image: 'assets/images/numbers/number_nine.png',
      sound: 'sounds/numbers/number_nine_sound.mp3',
      jpName: 'kyu',
      enName: 'nine',
    ),
    Number(
      image: 'assets/images/numbers/number_ten.png',
      sound: 'sounds/numbers/number_ten_sound.mp3',
      jpName: 'ju',
      enName: 'ten',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.brown[200],
        title: const Text('Numbers', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Item(
            sound: numbers[index].sound,
            color: Color(0xffFF9F3B),
            number: numbers[index],
          );
        },
      ),
    );
  }

}
