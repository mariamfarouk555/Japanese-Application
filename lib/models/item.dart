import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Item extends StatefulWidget {
  final String ? image;
  final String enName;
  final String jpName;
  final String sound;
  final Color color;
  final AudioPlayer player;

  const Item({
    super.key,
    required this.image,
    required this.enName,
    required this.jpName,
    required this.sound,
    required this.color,
    required this.player,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false; 
      });
    });
  }

  void _togglePlay() async {
    if (isPlaying) {
      await widget.player.stop();
      setState(() {
        isPlaying = false;
      });
    } else {
      await widget.player.play(AssetSource(widget.sound));
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
leading: ClipRRect(
  borderRadius: BorderRadius.circular(12),
  child: widget.image != null
      ? Image.asset(
          widget.image!,
          width: 55,
          height: 55,
          fit: BoxFit.cover,
        )
      : const SizedBox(
          width: 0,
          height: 0,
        ),
),


        title: Text(
          widget.enName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 246, 132, 197),
          ),
        ),
        subtitle: Text(
          widget.jpName,
          style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 227, 181, 231)),
        ),
        trailing: IconButton(
          onPressed: _togglePlay,
          icon: Icon(
            isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
