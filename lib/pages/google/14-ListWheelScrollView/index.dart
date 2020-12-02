

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class ListSheelScrollViewDemo extends StatefulWidget {
  @override
  _ListSheelScrollViewDemoState createState() => _ListSheelScrollViewDemoState();
}

class _ListSheelScrollViewDemoState extends State<ListSheelScrollViewDemo> {
  var _dataArr = [];

  void _loadData() async {
    final jsonStr = await rootBundle.loadString('lib/pages/ui/1-wxrun/data.json');
    Map obj = json.decode(jsonStr);
    List dataArr = obj['data'];
    dataArr.forEach( (item){
      print(item);
      if( item['isOwn'] == true ){
        dataArr.remove(item);
        dataArr.insert(0, item);
      }
    });
    _dataArr = dataArr;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: ListWheelScrollView.useDelegate(
        // 参数
        diameterRatio: 0.9,// 调整直径
        perspective: 0.001,
          offAxisFraction: -1,// 偏离中心
        itemExtent: _dataArr.length.toDouble(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              color: Colors.primaries[index % 10],
              alignment: Alignment.center,
              child: Text('${index}'),
            );
          }
        )
      )
    );
  }
}
