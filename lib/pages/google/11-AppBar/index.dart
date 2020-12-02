import './Demo1.dart';


import 'package:flutter/material.dart';

class AppBarDemo extends StatefulWidget {
  AppBarDemo({Key key}) : super(key: key);

  @override
  _AppBarDemoState createState() => _AppBarDemoState();
}

class _AppBarDemoState extends State<AppBarDemo> 
  with SingleTickerProviderStateMixin
{  
  TabController _tabController;

  @override
  void initState() { 
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      vsync: this,
      length: 3
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Container(
          width: 200,
          child: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black38,
            tabs: [
              Tab(child: Text('关于'),),
              Tab(child: Text('首页'),),
              Tab(child: Text('我的'),)
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions:[
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.search),
          )
        ] ,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          About(),
          Home(),
          Mine(),
        ],
      ),
    );
  }
}


class About extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Center(
      child: Text('关于'),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          RaisedButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Demo1()));
          }, child: Text('TabView切换动态更改颜色'),)
        ],
      ),
    );
  }
}

class Mine extends StatelessWidget {
  const Mine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的'),
    );
  }
}