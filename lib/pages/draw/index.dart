import '0-start/index.dart';
import '1-wave/index.dart';
import '3-canvas/index.dart';
import '4-draw/index.dart';
import '5-Demo/index.dart';
import '6-path/index.dart';
import 'package:flutter/material.dart';



class DrawView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 绘制相关'),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          RaisedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> WaveView())
            );
          },
            child: Text('1-水波波浪/波动效果'),
          ),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> WordView())
            );
          },
            child: Text('2-纯粹的世界'),
          ),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> CanvasView())
            );
          },
            child: Text('3-画布绘制的基础操作'),
          ),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> DrawDemo())
            );
          },
            child: Text('4-画笔的一些属性🖌️'),
          ),




          RaisedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> Demo5())
            );
          },
            child: Text('UI-路径️'),
          ),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> PathDemo())
            );
          },
            child: Text('6-认识一下Path吧'),
          ),










        ],
      ),
    );
  }
}
