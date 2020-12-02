import 'package:flutter/material.dart';

class WrapDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Container(
                width:300,
                height: 160,
                color: Colors.blue,
                child: Wrap(
                  children: [
                    box(),
                    box(),
                    box(),
                    box(),
                    box(),
                  ]
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                height: 300,
                color: Colors.blue,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    box(),
                    box(),
                    box(),
                    box(),
                    box(),
                    box(),
                    box(),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget box(){
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        width: 80,
        height: 80,
        color: Colors.green,
      ),
    );
  }


}