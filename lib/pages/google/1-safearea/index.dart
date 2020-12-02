import 'package:flutter/material.dart';

class SafeAreaDemo extends StatefulWidget {
  SafeAreaDemo({Key key}) : super(key: key);

  @override
  _SafeAreaDemoState createState() => _SafeAreaDemoState();
}

class _SafeAreaDemoState extends State<SafeAreaDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       *  SafeArea组件
       * 它使用MediaQuery来检测屏幕的尺寸。使应用程序与屏幕匹配。 
       * 无论使Ios还是Android都能保证你的程序内容正常显示。
       */
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('返回'))
              ],
        )),
      ),
    );
  }
}
