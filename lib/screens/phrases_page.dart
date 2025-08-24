import 'package:flutter/material.dart';
import 'package:project/components/phrases.dart';
//import 'package:toku/components/phrases.dart';
import '../models/number.dart';

class PhrasesPage extends StatelessWidget {
  PhrasesPage({super.key});

  final List<Number> numbers = [
    Number(
      image: '',
      sound: 'sounds/phrases/what_is_your_name.wav',
      jpName: 'anata no namae wa nani desu ka',
      enName: 'what is your name',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/how_are_you_feeling.wav',
      jpName: 'choushi wa dou desu ka',
      enName: 'how are you feeling',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/where_are_you_going.wav',
      jpName: 'doko ni ikiba masu ka',
      enName: 'where are you going',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/are_you_coming.wav',
      jpName: 'rai te i masu ka',
      enName: 'are you coming',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/yes_im_coming.wav',
      jpName: 'hai 、rai te i masu',
      enName: 'yes i am coming',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/i_love_anime.wav',
      jpName: 'anime ga daisuki',
      enName: 'i love anime',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/programming_is_easy.wav',
      jpName: 'programming wa kantan',
      enName: 'programming is easy',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/i_love_programming.wav',
      jpName: 'programming ga daisuki',
      enName: 'i love programming',
    ),
    Number(
      image: '',
      sound: 'sounds/phrases/dont_forget_to_subscribe.wav',
      jpName: 'o wasure naku t koudoku',
      enName: 'do not forget t subscribe',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF49332A),
        title: const Text('Phrases', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return PhrasesItem(
            color: const Color(0xff51B0D5),
            item: numbers[index],
          );
        },
      ),
    );
  }
}
