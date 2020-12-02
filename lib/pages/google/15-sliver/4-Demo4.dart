import 'package:flutter/material.dart';

final List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];


/*
*   CustomScrollView和Sliver：CustomScrollView是Flutter提供的可以用来自定义滚动效果的组件，它可以像胶水一样将多个Sliver粘合在一起
*
*   使用CustomScrollView组件作为滚动容器，SliverList和SliverGrid分别替代List和Grid作为CustomScrollView的子组件，
*   滚动效果再由CustomScrollView统一控制
* */

class Demo4 extends StatelessWidget {
  Widget renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          this.renderTitle('SliverGrid'),
          SliverGrid.count(
            crossAxisCount: 3,
            children: colorList.map((color) => Container(color: color)).toList(),
          ),

          this.renderTitle('SliverList'),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(color: colorList[index]),
              childCount: colorList.length,
            ),
            itemExtent: 100,
          ),
        ],
      ),
    );
  }
}