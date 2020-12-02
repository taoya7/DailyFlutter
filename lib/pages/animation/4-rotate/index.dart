import 'package:flutter/material.dart';


class RotateDemo extends StatefulWidget {
  @override
  _RotateDemoState createState() => _RotateDemoState();
}

class _RotateDemoState extends State<RotateDemo>
  with SingleTickerProviderStateMixin
{

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose(); // 释放
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotationTransition(
          turns: _animationController,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _animationController.repeat();// 永无止境的运行
          // _animationController.forward(); // 开始
          // _animationController.reset(); // 停止
        },
        child: Icon(Icons.repeat),
      ),
    );
  }
}
