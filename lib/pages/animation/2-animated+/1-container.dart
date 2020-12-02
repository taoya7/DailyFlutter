

import 'package:flutter/material.dart';

class AnimeContainer extends StatefulWidget {
  @override
  _AnimeContainerState createState() => _AnimeContainerState();
}

class _AnimeContainerState extends State<AnimeContainer> {

  double size = 100;
  double radius = 30;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("AnimatedContainer"),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(radius)
          ),
        ),
        Row(
          children: [
            RaisedButton(onPressed: (){
              setState(() {
                size += 100;
                radius += 30;
                if(size == 500 ){
                  size = 200;
                }
              });

            }, child: Text('Change'),)
          ],
        )
      ],
    );
  }
}
