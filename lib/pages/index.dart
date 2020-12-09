import 'package:Learn/router/index.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  List routers = [
    {
      "title": 'Some Widget',
      "to": "/Widgets",
    },
    {
      "title": 'Plug',
      'to': '/plug',
    },
    {
      "title": 'UI',
      'to': '/ui'
    },
    {
      "title": '与原生交互',
      "to": '/interaction'
    },
    {
      "title": '绘制',
      "to": '/draw',
    },
    {
      "title": '动画',
      "to": "/animation"
    },
    {
      "title": '滚动系列',
      "to": '/scroll'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由导航'),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView.builder(
            itemCount: routers.length,
            itemBuilder: (context, index){
              return RaisedButton(onPressed: (){
                Application.router.navigateTo(context, "${routers[index]['to']}");
              }, child: Text('${routers[index]["title"]}'));
            },
            shrinkWrap: true,
          ),
        )
      ),
    );
  }
}