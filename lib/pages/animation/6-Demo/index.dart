import 'package:flutter/material.dart';

class Demo6 extends StatefulWidget {
  @override
  _Demo6State createState() => _Demo6State();
}

class _Demo6State extends State<Demo6>
  with SingleTickerProviderStateMixin
{
  AnimationController _animationController;

  // 4吸7屏8呼 ~休息
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20)
    );

    // Animation anime1 = Tween(begin: 0.0, end: 1.0)
    //     .chain(CurveTween(curve: Interval(0.0, 0.2)))
    //     .animate(_animationController);
    // Animation anime3 = Tween(begin: 1.0, end: 0.0)
    //     .chain(CurveTween(curve: Interval(0.4, 0.95)))
    //     .animate(_animationController);


    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Box
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget child) {
            return Container (
              width: 300,
              height: 300,
              child: Text('${_animationController.value}'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                gradient: RadialGradient(
                  colors: [
                    Colors.blue[500],
                    Colors.blue[100],
                  ],
                  stops: [_animationController.value, _animationController.value+0.1],
                ),
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          _animationController.duration = Duration(seconds: 4);
          _animationController.forward();
          await Future.delayed(Duration(seconds: 4));
          await Future.delayed(Duration(seconds: 7));
          _animationController.duration = Duration(seconds: 8);
          _animationController.reverse();
        },
        child: Icon(Icons.style),
    ),
    );
  }

}
