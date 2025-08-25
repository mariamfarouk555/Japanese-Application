import 'package:flutter/material.dart';
import '../screens/number.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/components/item.dart';

class NumbersPage extends StatelessWidget {
  NumbersPage({super.key});

  final AudioPlayer player = AudioPlayer();

  final List<Number> numbers = [
    Number(
      image: 'assets/images/numbers/number_one.png',
      sound: 'sounds/numbers/number_one_sound.mp3',
      jpName: 'ichi',
      enName: 'One',
    ),
    Number(
      image: 'assets/images/numbers/number_two.png',
      sound: 'sounds/numbers/number_two_sound.mp3',
      jpName: 'ni',
      enName: 'Two',
    ),
    Number(
      image: 'assets/images/numbers/number_three.png',
      sound: 'sounds/numbers/number_three_sound.mp3',
      jpName: 'san',
      enName: 'Three',
    ),
    Number(
      image: 'assets/images/numbers/number_four.png',
      sound: 'sounds/numbers/number_four_sound.mp3',
      jpName: 'yon',
      enName: 'Four',
    ),
    Number(
      image: 'assets/images/numbers/number_five.png',
      sound: 'sounds/numbers/number_five_sound.mp3',
      jpName: 'go',
      enName: 'Five',
    ),
    Number(
      image: 'assets/images/numbers/number_six.png',
      sound: 'sounds/numbers/number_six_sound.mp3',
      jpName: 'roku',
      enName: 'Six',
    ),
    Number(
      image: 'assets/images/numbers/number_seven.png',
      sound: 'sounds/numbers/number_seven_sound.mp3',
      jpName: 'nana',
      enName: 'Seven',
    ),
    Number(
      image: 'assets/images/numbers/number_eight.png',
      sound: 'sounds/numbers/number_eight_sound.mp3',
      jpName: 'hachi',
      enName: 'Eight',
    ),
    Number(
      image: 'assets/images/numbers/number_nine.png',
      sound: 'sounds/numbers/number_nine_sound.mp3',
      jpName: 'kyu',
      enName: 'Nine',
    ),
    Number(
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
        backgroundColor: const Color(0XFF49332A),
        title: const Text(
          'Numbers',
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
                    color: Color(0xffFF9F3B), size: 35),
              ),
            ),
          );
        },
      ),
    );
  }
}
