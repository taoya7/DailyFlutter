

import 'dart:math';

import 'package:flutter/material.dart';

class CanvasView extends StatefulWidget {
  @override
  _CanvasViewState createState() => _CanvasViewState();
}

class _CanvasViewState extends State<CanvasView> {
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomPaint(
        size: Size(width, height),
        painter: PaperPainter(),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {
  Paint _gridPint; // 画笔
  final double step = 25; // 小格边长
  final double strokeWidth = 0.5; // 线宽
  final Color color = Colors.grey; // 线颜色

  PaperPainter() {
    _gridPint = Paint() // 初始化笔
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2); // 布局为中心
    _drawGrid(canvas, size);// 绘制网格
    _drawPart(canvas); // 自定义绘制

    _drawSun(canvas, size);
  }

  // 画一个Sun
  void _drawSun(Canvas canvas, Size size){
    canvas.translate(0, -300); // 布局为中心
    var paint = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.orange;
    canvas.drawCircle(Offset(0, 0), 50, paint);

    final int count = 12;
    paint
      ..strokeWidth = 10  // 边框
      ..strokeCap = StrokeCap.round // 线帽

    ;
    for (int i = 0; i < count; i++) {
      var step = 2 * pi / count; // 角度 12个线条 每个就是  360deg/r
      canvas.drawLine(Offset(80, 0), Offset(100, 0), paint);
      canvas.rotate(step);
    }
  }

  void _drawPart(Canvas canvas) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;
    canvas.drawCircle(Offset(0, 0), 100, paint);
    canvas.drawLine(
        Offset(20, 20),
        Offset(50, 50),
        paint
          ..color = Colors.pink
          ..strokeWidth = 50
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
    );
  }

  void _drawGrid(Canvas canvas, Size size) {
    _drawBottomRight(canvas, size);

    canvas.save();
    canvas.scale(1, -1); //沿x轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, 1); //沿y轴镜像
    _drawBottomRight(canvas, size);
    canvas.restore();

    canvas.save();
    canvas.scale(-1, -1); //沿原点镜像
    _drawBottomRight(canvas, size);
    canvas.restore();
  }

  void _drawBottomRight(Canvas canvas, Size size) {
    canvas.save();
    for (int i = 0; i < size.height / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(size.width / 2, 0), _gridPint);
      canvas.translate(0, step);
    }
    canvas.restore();

    canvas.save();
    for (int i = 0; i < size.width / 2 / step; i++) {
      canvas.drawLine(Offset(0, 0), Offset(0, size.height / 2), _gridPint);
      canvas.translate(step , 0);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
