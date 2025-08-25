import 'package:flutter/material.dart';
import '../screens/number.dart';
import 'package:audioplayers/audioplayers.dart';

class PhrasesPage extends StatelessWidget {
  PhrasesPage({super.key});

  final AudioPlayer player = AudioPlayer();

  final List<Number> numbers = [
    Number(
      image: '',
      sound: 'sounds/phrases/what_is_your_name.wav',
      jpName: 'anata no namae wa nani desu ka',
      enName: 'What is your name',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/how_are_you_feeling.wav',
      jpName: 'choushi wa dou desu ka',
      enName: 'How are you feeling',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/where_are_you_going.wav',
      jpName: 'doko ni ikiba masu ka',
      enName: 'Where are you going',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/are_you_coming.wav',
      jpName: 'rai te i masu ka',
      enName: 'Are you coming',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/yes_im_coming.wav',
      jpName: 'hai, rai te i masu',
      enName: 'Yes, I am coming',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/i_love_anime.wav',
      jpName: 'anime ga daisuki',
      enName: 'I love anime',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/programming_is_easy.wav',
      jpName: 'programming wa kantan',
      enName: 'Programming is easy',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/i_love_programming.wav',
      jpName: 'programming ga daisuki',
      enName: 'I love programming',
    ),
    Number(
      image: '',
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
        backgroundColor: const Color(0XFF49332A),
        title: const Text(
          'Phrases',
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
              title: Text(
                numbers[index].enName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff49332A),
                ),
              ),
              subtitle: Text(
                numbers[index].jpName,
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              trailing: IconButton(
                onPressed: () {
                  player.play(AssetSource(numbers[index].sound));
                },
                icon: const Icon(Icons.play_circle_fill,
                    color: Color(0xff51B0D5), size: 35),
              ),
            ),
          );
        },
      ),
    );
  }
}
