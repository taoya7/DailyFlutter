import 'package:flutter/material.dart';


class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  // 颜色
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.white,
    Colors.green,
    Colors.orange
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              title: Text('Logo'),
          )];
        },
        /// 构建列表
        body: ListView.builder(
          itemCount: colors.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              width: double.infinity,
              height: 400,
              color: colors[index],
              child: Center(
                child: Text('${index}', style: TextStyle(
                  fontSize: 28
                ),),
              ),
            );
        })
      ),
    );
  }
}
