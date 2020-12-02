

import 'package:flutter/material.dart';

import 'package:logger/logger.dart';
/*
*   https://pub.dev/packages/logger/install
* */

class PlugLogger extends StatefulWidget {
  @override
  _PlugLoggerState createState() => _PlugLoggerState();
}

class _PlugLoggerState extends State<PlugLogger> {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  var loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  @override
  void initState() {
    super.initState();
    logger = new Logger();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              RaisedButton(
                child: Text('.d'),
                onPressed: (){
                  logger.d("Logger is working!");
                },
              ),

              RaisedButton(
                child: Text('.w'),
                onPressed: (){
                  logger.w("🐸 Taoya: 警告警告！");
                },
              ),

              RaisedButton(
                child: Text('.e'),
                onPressed: (){
                  logger.e("🐸 Taoya: 发生了一个错误呦！");
                },
              ),




            ],
          )
        ],
      ),
    );
  }
}

