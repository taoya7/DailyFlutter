
import 'package:flutter/material.dart';

class TweenAnimationBuilderDemo extends StatefulWidget {
  @override
  _TweenAnimationBuilderDemoState createState() => _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('TweenAnimationBuilder'),
        TweenAnimationBuilder(
            tween: Tween(begin: 100.0, end: 300.0), // 100~300
            duration: const Duration(seconds: 2),
            builder: (BuildContext context, value, Widget child){
              return Container(
                width: value,
                height: value,
                color: Colors.green,
                child: Text('${value}'),
              );
            }
        ),
      ],
    );
  }
}
