import 'package:flutter/material.dart';


class Demo2 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo2> {
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
        /// 重点看这里
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0.1, // 阴影
                expandedHeight: 230, // 高度
                pinned: true,
                /// 重点
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('读书'),
                  background: Image.network(
                    "http://alicdn.taoya.art/img/20201201145815.jpg",
                    fit: BoxFit.fitHeight,
                  ),
                ),
            )];
          },
          /// 构建列表
          body: ListView.builder(
              itemCount: colors.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
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
