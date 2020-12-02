

import 'package:flutter/material.dart';

import 'cool_button.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  Color buttonColor = Color(0xfffcb7d6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff013bca),
      body: Stack(
        children: [
          Center(
            child: Text('页面1'),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: CoolButton(
              curPageAccentColor: Color(0xff013bca),
              buttonColor: Color(0xfffcb7d6),
              nextButtonColor: Colors.white,
              pushPage: PageTwo(),
            ),
          ),
        ],
      ),
    );
  }
}


class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcb7d6),
      body: Stack(
        children: [
          Center(
            child: Text('页面2'),
          ),
          Align(
              alignment: Alignment(0, 0.5),
              child: CoolButton(
                curPageAccentColor: Color(0xfffcb7d6),
                buttonColor: Colors.white,
                nextButtonColor: Colors.green,
                pushPage: PageThree(),
              )),
        ],
      ),
    );
  }
}


class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Text('页面3'),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: CoolButton(
              curPageAccentColor: Colors.white,
              buttonColor: Colors.green,
              nextButtonColor: Colors.red,
              pushPage: PageFour(),
            ),
          ),
        ],
      ),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Center(
            child: Text('页面4'),
          ),
          Align(
              alignment: Alignment(0, 0.5),
              child: CoolButton(
                curPageAccentColor: Colors.green,
                buttonColor: Colors.red,
                nextButtonColor: Colors.red,
                pushPage: PageTwo(),
              )),
        ],
      ),
    );
  }
}