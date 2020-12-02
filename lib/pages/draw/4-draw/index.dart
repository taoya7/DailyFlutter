import 'package:flutter/material.dart';

class DrawDemo extends StatefulWidget {
  @override
  _DrawDemoState createState() => _DrawDemoState();
}

class _DrawDemoState extends State<DrawDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Demo1
          CustomPaint(
            painter: CustomPainter1(),
            child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
            )
          ),

          /// Demo2
          CustomPaint(
              painter: CustomPainter2(),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
              )
          ),

          /// Demo3
          CustomPaint(
              painter: CustomPainter3(),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
              )
          ),


        ],
      ),
    );
  }
}

// color & isAntiAlias
class CustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();// 准备画笔
    canvas.drawCircle(
        Offset(50, 50),
        50,
        paint
          ..color = Colors.blue
          ..strokeWidth = 5);

    canvas.drawCircle(
        Offset(150, 50),
        50,
        paint
          ..isAntiAlias = false
          ..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// style & strokeWidth
class CustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();// 准备画笔
    canvas.drawCircle(
        Offset(50, 50),
        50,
        paint
          ..color = Colors.blue
          ..strokeWidth = 5
          ..style = PaintingStyle.stroke
    );

    canvas.drawCircle(
        Offset(150, 50),
        50,
        paint
          ..color = Colors.red
          ..style = PaintingStyle.fill
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CustomPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint();// 准备画笔
    paint // 统一的样式
      ..style = PaintingStyle.stroke
      ..color = Colors.blue
      ..strokeWidth = 20;

    canvas.drawLine(
        Offset(20, 0), Offset(80, 0), paint..strokeCap = StrokeCap.butt);

    canvas.drawLine(
        Offset(20, 20), Offset(80, 20),
        paint..strokeCap = StrokeCap.round);

    canvas.drawLine(
        Offset(20, 40), Offset(80, 40),
        paint..strokeCap = StrokeCap.square);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
