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
        // Background color
        Container(
          color: const Color(0xFFFFF5F7),
        ),

        // Heart 1
        const Positioned(
          top: 50,
          left: 30,
          child: Icon(
            Icons.favorite,
            color: Color(0x33FF85A1),
            size: 40,
          ),
        ),

        // Heart 2
        const Positioned(
          top: 200,
          right: 40,
          child: Icon(
            Icons.favorite,
            color: Color(0x33FF85A1),
            size: 50,
          ),
        ),

        // Star
        const Positioned(
          top: 350,
          left: 50,
          child: Icon(
            Icons.star,
            color: Color(0x33FF85A1),
            size: 40,
          ),
        ),

        // Circle
        Positioned(
          bottom: 150,
          right: 60,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0x33FF85A1),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        // Content
        child,
      ],
    );
  }
}