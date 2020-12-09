import 'package:flutter/material.dart';

import './1-scrollable.dart';
import './2-Demo.dart';


class ScrollIndex extends StatefulWidget {
  @override
  _ScrollIndexState createState() => _ScrollIndexState();
}

class _ScrollIndexState extends State<ScrollIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo1()));
          }, child: Text('1-Scrollabel'),),
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo2()));
          }, child: Text('2-下拉刷新'),),

        ],
      ),
    );
  }
}
