import 'dart:math' as math;
import 'package:flutter/material.dart';

class AestheticBackground extends StatelessWidget {
  final Widget child;

  const AestheticBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base color
        Container(color: const Color(0xFFFFF5F7)),
        
        // Custom shapes
        Positioned.fill(
          child: CustomPaint(
            painter: _BackgroundPainter(),
          ),
        ),
        
        // The actual content
        child,
      ],
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42); // Use a seed for consistent pattern
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Draw around 20-30 shapes
    for (int i = 0; i < 25; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final scale = random.nextDouble() * 0.5 + 0.5;
      final rotation = random.nextDouble() * math.pi * 2;
      final opacity = random.nextDouble() * 0.1 + 0.05; // Very subtle
      
      final shapeType = random.nextInt(4); // 0: Heart, 1: Circle, 2: Star, 3: Soft Square
      
      paint.color = const Color(0xFFFF85A1).withOpacity(opacity);

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(rotation);
      canvas.scale(scale);

      switch (shapeType) {
        case 0:
          _drawHeart(canvas, paint);
          break;
        case 1:
          _drawCircle(canvas, paint);
          break;
        case 2:
          _drawStar(canvas, paint);
          break;
        case 3:
          _drawSoftSquare(canvas, paint);
          break;
      }

      canvas.restore();
    }
  }

  void _drawHeart(Canvas canvas, Paint paint) {
    final path = Path();
    const double width = 40;
    const double height = 40;

    path.moveTo(0, height * 0.35);
    path.cubicTo(0, height * 0.1, -width * 0.5, 0, -width * 0.5, height * 0.35);
    path.cubicTo(-width * 0.5, height * 0.6, 0, height, 0, height);
    path.cubicTo(0, height, width * 0.5, height * 0.6, width * 0.5, height * 0.35);
    path.cubicTo(width * 0.5, 0, 0, height * 0.1, 0, height * 0.35);
    path.close();

    canvas.drawPath(path, paint);
  }

  void _drawCircle(Canvas canvas, Paint paint) {
    canvas.drawCircle(Offset.zero, 15, paint);
  }

  void _drawStar(Canvas canvas, Paint paint) {
    final path = Path();
    const int points = 5;
    const double outerRadius = 20;
    const double innerRadius = 10;
    
    for (int i = 0; i < points * 2; i++) {
      final angle = i * math.pi / points;
      final radius = i.isEven ? outerRadius : innerRadius;
      final x = math.cos(angle) * radius;
      final y = math.sin(angle) * radius;
      if (i == 0) path.moveTo(x, y);
      else path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawSoftSquare(Canvas canvas, Paint paint) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(-15, -15, 30, 30),
        const Radius.circular(8),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
