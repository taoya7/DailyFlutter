import 'package:flutter/material.dart';

class FloatBtnDemo extends StatefulWidget {
  FloatBtnDemo({Key key}) : super(key: key);

  @override
  _FloatBtnDemoState createState() => _FloatBtnDemoState();
}

class _FloatBtnDemoState extends State<FloatBtnDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(

      ),
      // 位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // 浮动按钮
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("点击了哦");
        },
      )
    );
  }
}