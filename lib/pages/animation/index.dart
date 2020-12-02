

import '1-try/index.dart';
import '2-animated+/index.dart';
import '3-calcdemo/index.dart';
import '4-rotate/index.dart';
import '5-coolRoute/index.dart';
import '6-Demo/index.dart';
import '7-Snow/index.dart';
import '8-Demo/index.dart';

import 'package:flutter/material.dart';

class AnimationHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AnimeTryDemo()));
          },
            child: Text('1-运行动画'),),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AnimatedMore()));
          },
            child: Text('2-Animated+ Widget'),),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CalcDemo()));
          },
            child: Text('3-翻滚吧计数器'),),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RotateDemo()));
          },
            child: Text('4-无尽的旋转-显示动画'),),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PageOne()));
          },
            child: Text('5-酷酷的路由'),),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Demo6()));
          },
            child: Text('6-478呼吸法'),),


          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DrawSnow()));
          },
            child: Text('7-无尽的雪花'),),

          RaisedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Demo8()));
          },
            child: Text('8-弹压的效果'),),


        ],
      ),
    );
  }
}
