import 'package:flutter/material.dart';

class AnimatedContainderDemo extends StatefulWidget {
  AnimatedContainderDemo({Key key}) : super(key: key);

  @override
  _AnimatedContainderDemoState createState() => _AnimatedContainderDemoState();
}

class _AnimatedContainderDemoState extends State<AnimatedContainderDemo> {
  double _width = 10;
  double _height = 10;
  Color _color = Colors.green;
  double _radius = 0;
  /**
   *  Flutter有很多用于控制显式动画的widgets。
   *  修改某个属性后会在两个值中间做一个线性插值运算。
   * 比如 colors, borders, borderRadius, background, images, 
   * shadows, 倾斜度gradients, 形状shapes, padding, width, height,
   * aligment, transforms, ...
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 650),
              curve: Curves.easeInCubic,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_radius)
              ),
            ),
            Wrap(
              children: [
                RaisedButton(onPressed: (){
                  print("长度变化");
                  setState(() {
                    _width = _width+20;
                    _height = _height+20;
                  });
                }, child: Text("长度变化")),
                RaisedButton(onPressed: (){
                  setState(() {
                    _color = Colors.blue;
                  });
                },child: Text("颜色变化"),),
                RaisedButton(onPressed: (){
                  setState(() {
                    _radius = _radius + 20;
                  });
                }, child: Text("圆角变化"),)
              ],
            )
          ],
        ),
      ),
    );
  }
}