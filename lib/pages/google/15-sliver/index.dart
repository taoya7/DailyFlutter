


import './3-%E7%BB%93%E5%90%88Tabbar.dart';
import './1-Demo1.dart';
import './2-Demo2.dart';
import './4-Demo4.dart';
import '5-自定义.dart';
import 'package:flutter/material.dart';

class SliverDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo1()));
          }, child: Text('1-滚动隐藏APPBar')),

          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo2()));
          }, child: Text('2-SliverAppBar展开折叠')),

          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo3()));
          }, child: Text('3-结合Tabbar')),

          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo4()));
          }, child: Text('4-CustomScroll')),

          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CustomSliverHeaderDemo()));
          }, child: Text('5-CustomSliverHeaderDemo')),
        ],
      ),
    );
  }
}
