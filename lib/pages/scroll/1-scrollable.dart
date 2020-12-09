import 'package:flutter/material.dart';

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
      ),
      body: Scrollbar( // 加一个滚动条
        child: ListView.builder(
          cacheExtent: 100,
          itemCount: 20,
          itemBuilder: (context, index){
            print("Build $index");
          return Container(
            width: double.infinity,
            height: 200,
            color: Colors.blue[(index%8)*100],
            // margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: Text('${index+1}'),
            ),
          );
        }),
      )
    );
  }
}
