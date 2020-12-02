
import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1>
  with SingleTickerProviderStateMixin // 1. 必须继承哦
{


  final List<Color> _colors = [
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.purple,
  ];

  TabController _mysTabController; // 控制器
  Color _color;

  @override
  void initState() {
    _color ??= _colors[0]; // 初始化颜色
    _mysTabController = TabController(vsync: this, length: _colors.length);

    _mysTabController.animation.addListener(() {
      setState(() {
        if(_mysTabController.offset > 0){
          //当Tab向右滑动时
          final ColorTween myscolor = ColorTween(
            begin: _colors[_mysTabController.index],
            end: _colors[_mysTabController.index + 1],
          );
          _color = myscolor.lerp(_mysTabController.offset);
        }
        if (_mysTabController.offset < 0) {
          //当Tab向左滑动时
          final ColorTween myscolor = ColorTween(
            begin: _colors[_mysTabController.index],
            end: _colors[_mysTabController.index - 1],
          );
          _color = myscolor.lerp(-_mysTabController.offset);
        }
        print(_mysTabController.offset); // 打印
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _mysTabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: _color,
        title: Text('s'),
        bottom: TabBar(
          controller: _mysTabController,
          tabs: <Widget>[
            Tab(
              text: "一",
            ),
            Tab(
              text: "二",
            ),
            Tab(
              text: "三",
            ),
            Tab(
              text: "四",
            ),
            Tab(
              text: "五",
            ),
            Tab(
              text: "六",
            ),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: _mysTabController,
          children: <Widget>[
            Container(
              child: Center(
                child: Text("MYScolor"),
              ),
            ),
            Container(
              child: Center(
                child: Text("MYScolor"),
              ),
            ),
            Container(
              child: Center(
                child: Text("MYScolor"),
              ),
            ),
            Container(
              child: Center(
                child: Text("MYScolor"),
              ),
            ),
            Container(
              child: Center(
                child: Text("MYScolor"),
              ),
            ),
            Container(
              child: Center(
                child: Text("MYScolor"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
