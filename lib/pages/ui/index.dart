
import './1-wxrun/index.dart';


import 'package:flutter/material.dart';
class UIView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          RaisedButton(
            child: Text('仿微信'),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>WxMotionTopPage()
                )
              );
            },
          )
        ],
      ),
    );
  }
}
