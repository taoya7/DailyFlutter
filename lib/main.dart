

import 'package:flutter/material.dart' hide Router;
import 'package:bot_toast/bot_toast.dart';

import './pages/index.dart';

import 'package:fluro/fluro.dart';
import './router/index.dart';

import './utils/splash.dart';

void main() {
  // 创建
  final router = new Router();
  // 绑定
  Routers.configureRoutes(router);
  // 全局赋值
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '学习Flutter',
      debugShowCheckedModeBanner: false, 
      // theme: ThemeData(
      //   primarySwatch: Colors.yellow,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // 去掉水波纹
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.green,
        highlightColor: Colors.transparent,
        splashFactory: NoSplashFactory(),
      ),
      home: Home(),
      onGenerateRoute: Application.router.generator,


      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}


