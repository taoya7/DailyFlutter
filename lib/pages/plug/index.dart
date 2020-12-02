

import 'package:flutter/material.dart';

import './psvg/index.dart';
import './dio/index.dart';
import './logger/index.dart';

class PlugIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('插件集合'),
      ),
      body: ListView(
        children: [
          // Svg-网络请求
          RaisedButton(child: Text('Svg-加载Svg资源'), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=> PlugSvg()
            ));
          },),


          // Dio-网络请求
          RaisedButton(child: Text('Dio-网络请求'), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=> PlugDio()
            ));
          },),

          RaisedButton(child: Text('Logger-日志记录'), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=> PlugLogger()
            ));
          },),
        ],
      ),
    );
  }
}
