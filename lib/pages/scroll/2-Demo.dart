import 'package:flutter/material.dart';

class Demo2 extends StatefulWidget {
  @override
  _Demo2State createState() => _Demo2State();
}

class _Demo2State extends State<Demo2> {

  var _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新演示'),
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        // 下拉刷新函数
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 2));
        },
        strokeWidth: 1,
        color: Colors.red,
        backgroundColor: Colors.orangeAccent,
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              color: Colors.blue[(index%9) * 100],
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
