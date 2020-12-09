
import 'Demo3.dart';
import 'Demo2.dart';
import 'Demo1.dart';
import 'package:flutter/material.dart';

import 'Demo1.dart';

class PathDemo extends StatefulWidget {
  @override
  _PathDemoState createState() => _PathDemoState();
}

class _PathDemoState extends State<PathDemo> with SingleTickerProviderStateMixin{

  TabController tabController; // 控制器
  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black12,
        bottom: TabBar(
          controller: tabController,
          unselectedLabelColor: Colors.black45,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          tabs: [
            Tab(
              text: "Demo1",
            ),
            Tab(
              text: "Demo2",
            ),
            Tab(
              text: "Demo3",
            ),
            Tab(
              text: "Demo4",
            ),
            Tab(
              text: "Demo5",
            ),
            Tab(
              text: "Demo6",
            ),
            Tab(
              text: "Demo7",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Demo1(),
          Demo2(),
          Demo3(),
          Demo3(),
          Demo3(),
          Demo3(),
          Demo3(),
        ],
      ),

    );
  }
}

