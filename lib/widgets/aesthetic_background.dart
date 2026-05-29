import 'package:flutter/material.dart';

class AestheticBackground extends StatelessWidget {
  final Widget child;

  const AestheticBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xFFFFF5F7),
        ),

        const Positioned(
          top: 50,
          left: 20,
          child: Text(
            "❤️",
            style: TextStyle(fontSize: 30),
          ),
        ),

        const Positioned(
          top: 150,
          right: 30,
          child: Text(
            "⭐",
            style: TextStyle(fontSize: 30),
          ),
        ),

        const Positioned(
          bottom: 100,
          left: 40,
          child: Text(
            "❤️",
            style: TextStyle(fontSize: 40),
          ),
        ),

        const Positioned(
          bottom: 200,
          right: 50,
          child: Text(
            "⭐",
            style: TextStyle(fontSize: 35),
          ),
        ),

        child,
      ],
    );
  }
}