


/*
*   使用SVG
*   https://pub.flutter-io.cn/packages/flutter_svg
* */
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';


class PlugSvg extends StatefulWidget {
  @override
  _PlugSvgState createState() => _PlugSvgState();
}

class _PlugSvgState extends State<PlugSvg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 加入Svg
            Container(
              width: 300,
              height: 300,
              child: SvgPicture.asset('assets/svg/cookie.svg'),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.red
                )
              ),
            )



          ],
        ),
      ),
    );
  }
}



