import 'package:Learn/router/index.dart';
import 'package:flutter/material.dart';

class IWidgets extends StatefulWidget {
  @override
  _IWidgetsState createState() => _IWidgetsState();
}

class _IWidgetsState extends State<IWidgets> {
  List routers = [
    {"title": "1-SafeArea", "to": "/1-safearea"},
    {"title": "2-Extanded", "to": "/2-expanded"},
    {"title": "3-Wrap", "to": "/3-wrap"},
    {"title": "4-AnimatedContainer", "to": "/4-animatedContainer"},
    {"title": "5-Opacity", "to": "/5-opacity"},
    {"title": "6-PageView", "to": "/6-pageview"},
    {"title": "7-Table", "to": "/7-table"},
    {"title": "8-FloatingActionButton", "to": '/8-fab'},
    {"title": "9-AspectRadio", "to": "/9-aspectRadio"},
    {"title": "10-Align", "to": "/10-align"},
    {"title": "11-AppBar", "to": "/11-AppBar"},
    {"title": '12-集成极光推送', "to": '/12-Jiguang'},
    {"title": '13-Text组件', "to": '/13-text'},
    {"title": "14-ListWheelScrollView", "to": "/14-ListWheelScrollView"},
    {"title": "15-Sliver家族", "to": "/15-sliver"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
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
      )
    );
  }
}
