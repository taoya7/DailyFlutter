import 'package:Learn/pages/interaction/1-try/index.dart';
import "package:flutter/material.dart";


class InteractionView extends StatefulWidget {
  @override
  _InteractionViewState createState() => _InteractionViewState();
}

class _InteractionViewState extends State<InteractionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
      ),
      body: ListView(
        children: [
          RaisedButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> TryView())
            );
          },
            child: Text('试'),
          )
        ],
      ),
    );
  }
}
