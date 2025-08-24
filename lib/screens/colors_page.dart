import 'package:flutter/material.dart';
import 'package:project/components/item.dart';
// import 'package:toku/components/item.dart';
import '../models/number.dart';

class ColorsPage extends StatelessWidget {
  ColorsPage({super.key});

  final List<Number> numbers = [
    Number(
      image: 'assets/images/colors/color_black.png',
      sound: 'sounds/colors/black.wav',
      jpName: 'kuroi',
      enName: 'black',
    ),
    Number(
      image: 'assets/images/colors/color_brown.png',
      sound: 'sounds/colors/brown.wav',
      jpName: 'kasshoku',
      enName: 'brown',
    ),
    Number(
      image: 'assets/images/colors/color_dusty_yellow.png',
      sound: 'sounds/colors/dusty yellow.wav',
      jpName: 'oi kiiro',
      enName: 'dusty_yellow',
    ),
    Number(
      image: 'assets/images/colors/color_gray.png',
      sound: 'sounds/colors/gray.wav',
      jpName: 'haiiro',
      enName: 'gray',
    ),
    Number(
      image: 'assets/images/colors/color_green.png',
      sound: 'sounds/colors/green.wav',
      jpName: 'midori',
      enName: 'green',
    ),
    Number(
      image: 'assets/images/colors/color_red.png',
      sound: 'sounds/colors/red.wav',
      jpName: 'akai',
      enName: 'red',
    ),
    Number(
      image: 'assets/images/colors/color_white.png',
      sound: 'sounds/colors/white.wav',
      jpName: 'shiroi',
      enName: 'white',
    ),
    Number(
      image: 'assets/images/colors/yellow.png',
      sound: 'sounds/colors/yellow.wav',
      jpName: 'kiiro',
      enName: 'yellow',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF49332A),
        title: const Text('Colors', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Item(
            sound: numbers[index].sound,
            color: const Color(0xff854CAE),
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
