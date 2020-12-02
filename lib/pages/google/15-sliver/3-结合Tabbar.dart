

import 'package:flutter/material.dart';

class Demo3 extends StatefulWidget {
  @override
  _Demo3State createState() => _Demo3State();
}

class _Demo3State extends State<Demo3>
  with SingleTickerProviderStateMixin
{

  TabController _tabController;

  // 颜色
  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.white,
    Colors.green,
    Colors.orange
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: 1,
        vsync: this,
        length: 2
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            elevation: 0.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('读书'),
              background: Image.network( "http://alicdn.taoya.art/img/20201201145815.jpg", fit: BoxFit.fitHeight),
            )
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this._tabController,
                tabs: <Widget>[
                  Tab(text: '资讯'),
                  Tab(text: '技术'),
                ],
              )
            ),
          ),
          SliverFillRemaining(
            child:TabBarView(
              controller: _tabController,
              children: [
                Text('1'),
                Text('2'),
              ],
            ),
          )
        ]
      ),
    );
  }
}


/// 需要实现一个类继承自SliverPersistentHeaderDelegate
class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
