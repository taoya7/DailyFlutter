import 'package:flutter/material.dart';

/**
 * 使用Flutter的GridView可以轻松实现可滚动的网格效果。但是如果你不想让其中一个格子滑动。
 *  Table
 *  - TableRow
 * 
 * 
 */

class TableDemo extends StatefulWidget {
  TableDemo({Key key}) : super(key: key);

  @override
  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.blue,
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.red
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          color: Colors.green,
                        )
                      ]
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget box(){
    return Container(
      width: 30,
      height: 30,
      color: Colors.green,
    );
  }
}