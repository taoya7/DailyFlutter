
import 'package:flutter/material.dart';


class AnimeTryDemo extends StatefulWidget {
  @override
  _AnimeTryDemoState createState() => _AnimeTryDemoState();
}

class _AnimeTryDemoState extends State<AnimeTryDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 运动一个物体
            Demo1(),


          ],
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////////////


/// 运动一个物体
class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

//1.需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _Demo1State extends State<Demo1> with SingleTickerProviderStateMixin{

  //2. 声明动画控制器
  AnimationController _animationController; // 动画控制器
  Animation<double> _runCtrl; // 声明距离控制器
  Animation<Color> _colorCtrl; //  声明颜色控制器

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,

    );

    // 距离变化
    _runCtrl = new Tween(begin: 0.0, end: 300.0)
        .animate(_animationController)
        ..addListener(() {
          setState(() {
            print(_runCtrl.value); // 打印补间插值
          });
    });

    // 颜色变化
    _colorCtrl = ColorTween(begin: Colors.blueGrey, end: Colors.blue).animate(_animationController);
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    // 路由销毁时需要释放动画资源
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(left: _runCtrl.value),
          color: _colorCtrl.value,
        ),
        Row(
          children: [
            RaisedButton(onPressed: (){
              print("开始运动");
              _animationController.forward();
            },
              child:  Text('开始'),
            ),
            RaisedButton(onPressed: (){
              print("Click");
              _animationController.reverse();
            },
              child:  Text('返回'),
            ),
          ],
        ),
      ],
    );
  }
}

