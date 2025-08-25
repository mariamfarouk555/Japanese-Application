import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../screens/number.dart';

class ColorsPage extends StatelessWidget {
  ColorsPage({super.key});

  final AudioPlayer player = AudioPlayer();

  final List<Number> numbers = [
    Number(
      image: 'assets/images/colors/color_black.png',
      sound: 'sounds/colors/black.wav',
      jpName: 'kuroi',
      enName: 'Black',
    ),
    Number(
      image: 'assets/images/colors/color_brown.png',
      sound: 'sounds/colors/brown.wav',
      jpName: 'kasshoku',
      enName: 'Brown',
    ),
    Number(
      image: 'assets/images/colors/color_dusty_yellow.png',
      sound: 'sounds/colors/dusty yellow.wav',
      jpName: 'oi kiiro',
      enName: 'Dusty Yellow',
    ),
    Number(
      image: 'assets/images/colors/color_gray.png',
      sound: 'sounds/colors/gray.wav',
      jpName: 'haiiro',
      enName: 'Gray',
    ),
    Number(
      image: 'assets/images/colors/color_green.png',
      sound: 'sounds/colors/green.wav',
      jpName: 'midori',
      enName: 'Green',
    ),
    Number(
      image: 'assets/images/colors/color_red.png',
      sound: 'sounds/colors/red.wav',
      jpName: 'akai',
      enName: 'Red',
    ),
    Number(
      image: 'assets/images/colors/color_white.png',
      sound: 'sounds/colors/white.wav',
      jpName: 'shiroi',
      enName: 'White',
    ),
    Number(
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
        backgroundColor: const Color(0XFF49332A),
        title: const Text(
          'Colors',
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
                    color: Color(0xff854CAE), size: 35),
              ),
            ),
          );
        },
      ),
    );
  }
}
