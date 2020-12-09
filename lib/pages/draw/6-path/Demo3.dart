import 'package:flutter/material.dart';

class Demo3 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo3> {
  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: MyPainter(),
            )
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width/8, size.height/2);
    Paint _paint = Paint()..color = Colors.blue;
    canvas.drawLine(Offset(-size.width/2, 0), Offset(size.width, 0), _paint);
    canvas.drawLine(Offset(0, -size.height/2), Offset(0, size.height), _paint);

    // Demo3 quadraticBezierTo和relativeQuadraticBezierTo: 二阶贝塞尔
    Paint _paint1 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
    ;
    Path _path1 = Path();
    _path1.quadraticBezierTo(100,-100, 160,50);
    _path1.relativeQuadraticBezierTo(100,-100, 160,50);
    _paint.color = Colors.orangeAccent;
    canvas.drawPath(_path1, _paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
