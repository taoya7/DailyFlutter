

import 'package:flutter/material.dart';

class CalcDemo extends StatefulWidget {
  @override
  _CalcDemoState createState() => _CalcDemoState();
}

class _CalcDemoState extends State<CalcDemo> {
  int _counter = 0;
  void _add(){
    setState(() {
      _counter += 10;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 120,
          color: Colors.blue,
          child: AnimatedCounter(
            duration: Duration( milliseconds: 300),
            value: _counter
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _add
      ),
    );
  }
}


class AnimatedCounter extends StatelessWidget {
  final Duration duration;
  final int value;
  AnimatedCounter({ @required this.duration, this.value });
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(end: value.toDouble()),
        duration: duration,
        builder: (BuildContext context, value, Widget child) {
          final whole = value ~/ 1; // 1~9
          final decimal = value - whole;
          return Stack (
            children: [
              Positioned(
                top: -100*decimal,
                child: Opacity(
                  opacity: 1.0 - decimal,
                  child: Text(
                    '${whole}',
                    style: TextStyle(
                      fontSize: 100,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100 - decimal*100,
                child: Opacity(
                  opacity: decimal,
                  child: Text(
                    '${whole+1}',
                    style: TextStyle(
                      fontSize: 100
                    ),
                  ),
                ),
              )
            ],
          );
        },
    );
  }
}
