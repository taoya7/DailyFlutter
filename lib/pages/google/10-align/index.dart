import 'package:flutter/material.dart';

class AlignDemo extends StatefulWidget {
  AlignDemo({Key key}) : super(key: key);

  @override
  _AlignDemoState createState() => _AlignDemoState();
}
/**
 * Widget之间的组合能力是Flutter最强特色之一。
 * 
 * 但是？如何指定子widget在父widget中布局或地位的呢？
 * 
 * 
 */

class _AlignDemoState extends State<AlignDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            box(Alignment.bottomLeft),
            box(Alignment.bottomCenter),
            box(Alignment.bottomRight),

            // 也可以按照具体某个值进行对其 -1<=>1
            box(Alignment(-1, 0))
          ],
        ),
      ),
    );
  }

   Widget box(position){
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue, // 颜色
          border: Border.all( // 边框
            color: Colors.black,
            width: 3.0,
          ),
        ),
        child: Align(
          alignment: position,
          child: Text('T', style: TextStyle(
            fontSize: 36,
            color: Colors.white
          ),),
        ),
      );
    }
}