

import 'package:flutter/material.dart';

import '1-container.dart';
import '2-switcher.dart';
import '3-tweenAnimationBuilder.dart';

class AnimatedMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: PageView(
        children: [
          AnimeContainer(),
          AnimeSwitcher(),
          TweenAnimationBuilderDemo(),
        ],
      ),
    );
  }
}
