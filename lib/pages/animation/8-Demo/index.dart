

import 'package:flutter/material.dart';


class Demo8 extends StatefulWidget {
  @override
  _Demo8State createState() => _Demo8State();
}

class _Demo8State extends State<Demo8>
  with SingleTickerProviderStateMixin
{
  // 动画控制器
  AnimationController _animationController;
  Animation _animation;
  Animation<Offset> _sliderAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this
    );
    _animationController.addListener(() {
      setState(() {

      });
    });
    _animation = Tween(begin: 0, end: 1.0)
        .animate(_animationController);
    _sliderAnimation = Tween(begin: Offset(0, -0.5), end: Offset(0, 0))
        .animate(_animationController);

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /// 填充布局
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack( // 层叠布局
            children: [
              /// 底部的内容
              buildBottomMenu(),
              /// 按钮
              buildButton(),
              /// 文字
              buildText(),
            ],
          ),
        ),
      )
    );
  }
  Widget  buildBottomMenu(){
    return Positioned(
      height: 62,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        child: CustomPaint(// 绘制
          painter: ICustomPainter(_animationController.value),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
  // 构建文字
  Widget buildText(){
    return Positioned(
      top: 120,
      left: 0,
      right: 0,
      child: Text(
        'Hello Flutter',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.deepOrangeAccent
        ),
      ),
    );
  }

  Widget buildButton(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _sliderAnimation,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            onTap: (){
              if(_animationController.isCompleted){
                _animationController.reverse();
              }else{
                _animationController.reset();
                _animationController.forward();
              }
            },
            child:  Container (
              margin: EdgeInsets.only(bottom: 22),
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        )
      ),
    );
  }
}

// 绘制
class ICustomPainter extends CustomPainter {

  double progress;

  ICustomPainter(this.progress);

  Paint _paint = Paint()..color = Colors.deepOrange;
  @override
  void paint(Canvas canvas, Size size) {
    // 画一个矩形
    Path _path = new Path();
    _path.moveTo(0, 0);

    // 画三阶曲线
    _path.lineTo(size.width/4+size.width/8*progress, 0);
    // 控制点1
    double x1 = size.width/4+ size.width/8*progress;
    double y1 = 64 *  progress;
    // 控制点2
    double x2 = size.width/2 + size.width/8;
    double y2 = 64 * progress;
    // 终点
    double x3 = size.width/2 + size.width*2/8 - size.width/8*progress;
    double y3 = 0;
    _path.cubicTo(x1, y1, x2, y2, x3, y3);


    _path.lineTo(size.width, 0);
    _path.lineTo(size.width, size.height);
    _path.lineTo(0, size.height);
    _path.close();

    // 绘制
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
