import 'package:flutter/material.dart';

/**
 * AspectRadio: 你可能不太关心控件的具体的大小。但是你会关心它的长宽比例。
 * 假如我们想要widget获得与实际尺寸无关的宽度。
 * AspectRadio是宽度/高度之间的比率
 * 
 * Align将Expanded强制充满整个空间。
 */

class AxpectRadioDemo extends StatefulWidget {
  AxpectRadioDemo({Key key}) : super(key: key);

  @override
  _AxpectRadioDemoState createState() => _AxpectRadioDemoState();
}

class _AxpectRadioDemoState extends State<AxpectRadioDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 5/1,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}