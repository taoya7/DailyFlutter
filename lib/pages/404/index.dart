import 'package:flutter/material.dart';

class Global404 extends StatefulWidget {
  Global404({Key key}) : super(key: key);

  @override
  _Global404State createState() => _Global404State();
}

class _Global404State extends State<Global404> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Text('404', style: TextStyle(
          fontSize: 48,
        ),),
      ),
    );
  }
}