import 'package:flutter/material.dart';


class WordView extends StatefulWidget {
  @override
  _WordViewState createState() => _WordViewState();
}

class _WordViewState extends State<WordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 绘制一个圆
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red)
              ),
              child: CustomPaint(
                painter: PaperPainter1(),
              ),
            ),

            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.red)
              ),
              child: CustomPaint(
                child: Stack(
                  children: [
                    Positioned(
                      top: 90,
                      left: 100,
                      child: Container(
                        width: 2,
                        height: 2,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                painter: PaperPainter2(),
              ),
            ),


            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.red)
              ),
              child: CustomPaint(
                painter: PaperPainter3(),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

// 圆
class PaperPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint();
    // 绘制圆
    canvas.drawCircle(Offset(0, 0), 100, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// 线
class PaperPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint();
    paint
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke // 模型--线
    ;
    // 绘制圆
    canvas.drawLine(Offset(0, 0), Offset(90, 100), paint);  //绘制线
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// 移动
class PaperPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 创建画笔
    final Paint paint = Paint();
    paint
      ..color = Colors.blue //颜色
      ..strokeWidth = 4 //线宽
      ..style = PaintingStyle.stroke; //模式--线型

    //绘制线
    canvas.drawLine(Offset(0, 0), Offset(100, 100), paint);

    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(200, 0);
    canvas.drawPath(path, paint..color = Colors.red);
  }

  void drawLine(Canvas canvas) {}

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}