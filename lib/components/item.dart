import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project/screens/number.dart';


class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.number,
    required this.color,
    required this.sound,
  });

  final String sound;
  final Number number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: color,
      child: Row(
        children: [
          Container(
            color: const Color(0xffFFF4DB),
            child: Image.asset(number.image),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  number.jpName,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  number.enName,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: IconButton(
              splashColor: Colors.blue[800],
              onPressed: () async {
                final player = AudioPlayer();
                await player.play(AssetSource(number.sound));
              },
              icon: const Icon(Icons.play_arrow, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
