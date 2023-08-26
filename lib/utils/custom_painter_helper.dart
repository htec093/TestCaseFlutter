import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.20); // Start
    path.lineTo(size.width * 0.35, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.20, size.width * 0.40, size.height * 0.30);
    path.arcToPoint(Offset(size.width * 0.60, size.height * 0.30), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.20, size.width * 0.65, size.height * 0.20);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 10, true);
    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

