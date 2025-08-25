import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({
    required this.text,
    required this.color,
    required this.ontap,
    super.key,
  });

  final String text;
  final Color color;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        height: 60,
        width: double.infinity,
        color: color,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
