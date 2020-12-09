import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
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
    canvas.translate(size.width/2, size.height/2);
    Paint _paint = Paint()..color = Colors.blue;
    canvas.drawLine(Offset(-size.width/2, 0), Offset(size.width/2, 0), _paint);
    canvas.drawLine(Offset(0, -size.height/2), Offset(0, size.height/2), _paint);
    // Demo1
    Paint _paint1 = Paint()..color = Colors.blue; // 画右边
    Path _path1 = Path();
    _path1..moveTo(0, 0)
      ..lineTo(0, -80)
      ..lineTo(60, 0)
      ..lineTo(60, 80)
      ..close(); //闭合路径
    _paint.color = Colors.orangeAccent;
    canvas.drawPath(_path1, _paint1);
    Paint _paint2 = Paint() // 画左边
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    Path _path2 = Path();
    _path2..moveTo(0, 0)
      ..lineTo(0, -80)
      ..lineTo(-60, 0)
      ..lineTo(-60, 80)
      ..close();
    canvas.drawPath(_path2, _paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
