


import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //


class TryView extends StatefulWidget {
  @override
  _TryViewState createState() => _TryViewState();
}

class _TryViewState extends State<TryView> {
  static const  methodChannel = const MethodChannel('testflutter'); // 建立交互通道

  String _test1;
  Future<Null> invokNative() async {
    String test1;
    String method = '';
    Map msg = new Map();
    msg['url'] = 'http://www.baidu.com';
    test1 = await methodChannel.invokeMethod(method,msg);
    setState(() {
      _test1 = test1;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text('阅览文章 https://juejin.cn/post/6844903941138841613'),

          RaisedButton(onPressed: (){
            print('click');
            invokNative();
          }, child: Text('点击'),)
        ],
      ),
    );
  }
}
