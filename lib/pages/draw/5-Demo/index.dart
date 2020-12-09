
import 'package:flutter/material.dart';


class Demo5 extends StatefulWidget {
  @override
  _Demo5State createState() => _Demo5State();
}

class _Demo5State extends State<Demo5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            buildTop(),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return Positioned(
      height: 200,
      top: 0,
      left: 0,
      right: 0,
      child: CustomPaint(
        painter: Draw1(),
      ),
    );
  }
}

class Draw1 extends CustomPainter{
  final Paint _paint = Paint()..color=Color(0xff9FCCCD); // 画笔
  @override
  void paint(Canvas canvas, Size size) {
    Path _path = new Path();
    _path.moveTo(0, 0);
    _path.lineTo(size.width, 0);
    _path.lineTo(size.width, size.height);
    // _path.quadraticBezierTo(size.width*0.8, size.height*0.8, size.width*0.3, size.height*0.5 );
    _path.cubicTo(size.width*0.8, size.height*0.8, size.width*0.5, size.height*0.5, size.width*0.4, size.height*0.8 );
    _path.relativeQuadraticBezierTo(30,1, 1,2);
    _path.lineTo(0, size.height*0.5);
    _path.close();
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


