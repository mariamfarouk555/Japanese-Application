import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project/models/number.dart';
import 'package:project/screens/number.dart';


class PhrasesItem extends StatelessWidget {
  const PhrasesItem({super.key, required this.item, required this.color});

  final Number item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.jpName,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  item.enName,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: IconButton(
              splashColor: const Color.fromARGB(255, 32, 3, 83),
              onPressed: () async {
                final player = AudioPlayer();
                await player.play(AssetSource(item.sound));
              },
              icon: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}

