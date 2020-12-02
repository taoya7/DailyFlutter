
import 'dart:math';

import 'package:flutter/material.dart';


class DrawSnow extends StatefulWidget {
  @override
  _DrawSnowState createState() => _DrawSnowState();
}

class _DrawSnowState extends State<DrawSnow>
  with SingleTickerProviderStateMixin // 1. 继承
{
  AnimationController _controller;
  // 生成雪花
  List<SnowFlake> _snowflakes = List.generate(100, (index) => SnowFlake());
  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    )..repeat(); // 动画控制器
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose(); // 释放资源
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(// 样式修饰
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ Colors.blue, Colors.lightBlue, Colors.white ],
              stops: [0.0, 0.7, 0.95]
            ),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            // 每一帧都会执行这个函数哦
            builder: (BuildContext context, Widget child) {
              _snowflakes.forEach((element) {
                element.fail();
              });
              return CustomPaint(
                painter:  MyPainter(_snowflakes),
              );
            },
          ),
        ),
      ),
    );
  }
}


class MyPainter extends CustomPainter {

  List<SnowFlake> _snowflakes;

  MyPainter(this._snowflakes); // 雪花

  @override
  void paint(Canvas canvas, Size size) {
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(size.center(Offset(0, 110)), 60.0,
      whitePaint
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: size.center(Offset(0, 280)),
        width: 200,
        height: 250
      )
      ,whitePaint);

    _snowflakes.forEach((element) {
      canvas.drawCircle(Offset(element.x, element.y), element.radius, whitePaint);
    });

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class SnowFlake {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble()*700;
  double radius = Random().nextDouble()*2 +2;
  double velocity = Random().nextDouble() +2;

  fail(){ // 下落
    y += velocity;
    if(y > 800) {
      y = 0;
      x = Random().nextDouble() * 400;
      radius = Random().nextDouble()*2 +2;
      velocity = Random().nextDouble()*4 +2;
    }
  }
}