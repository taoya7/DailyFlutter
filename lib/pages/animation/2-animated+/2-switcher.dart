import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class AnimeSwitcher extends StatefulWidget {
  @override
  _AnimeSwitcherState createState() => _AnimeSwitcherState();
}

class _AnimeSwitcherState extends State<AnimeSwitcher> {

  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('AnimatedSwitcher-组件child切换动画'),
        AnimatedContainer(
          duration: Duration( seconds: 1),
          width: 300,
          height: 300,
          color: Colors.pink,
          curve: Curves.bounceIn,
          child: AnimatedSwitcher(
            // 如果自定义的话
            transitionBuilder: (child, animation){
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            },
            duration: Duration(seconds: 2),
            child: flag==false ? CircularProgressIndicator()
                        : Text('ok', style: TextStyle(
              fontSize: 48
            ),)
          ),
        ),
        RaisedButton(onPressed: (){
          BotToast.showText(text: "flag: ${flag}");
          setState(() {
            flag = !flag;
          });
        }, child: Icon(Icons.style, color: Colors.green,))

      ],
    );
  }
}
