import 'package:flutter/material.dart';

class OpacityDemo extends StatefulWidget {
  OpacityDemo({Key key}) : super(key: key);

  @override
  _OpacityDemoState createState() => _OpacityDemoState();
}

class _OpacityDemoState extends State<OpacityDemo> {
  double _op = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        /**
       * Flutter中，很容易就可以完全移除一个Widget。
       * 你只要在重新渲染时移除它即可。如果想要它消失，原来占据的空间仍然被保存呢？
       * 
       * opacity组件控制组件的透明度
       * 
       * 也可以将栈视图的不同视图混合在一起哦。
       */
        body: SingleChildScrollView(
          child: Column(
            children: [
              Opacity(
                opacity: _op,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
              ),
              Text("${_op}"),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if(_op == 1.0){
                      _op = 1.0;
                      return ;
                    }
                    _op = _op + 0.1;
                  });
                },
                child: Text('+0.1'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    if(_op == 0.0){
                      return ;
                    }
                    _op = _op - 0.1;
                  });
                },
                child: Text('-0.1'),
              ),

              SizedBox(height: 100),
              AnimatedOpacity(
                duration: Duration(milliseconds: 600),
                opacity: _op,
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/img/2.jpg"),
                ),
              )
            ],
          ),
        ));
  }
}
