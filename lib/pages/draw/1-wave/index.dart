
import 'dart:math';
import 'package:flutter/material.dart';

/*
*   水波效果
* */

class WaveView extends StatefulWidget {
  @override
  _WaveViewState createState() => _WaveViewState();
}

class _WaveViewState extends State<WaveView>
  with SingleTickerProviderStateMixin {

  ///动画控制器
  AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    //创建动画控制器
    _animationController = AnimationController(
      //默认的初始值
      value: 0.0,
      //执行时间
      duration: Duration(seconds: 10),
      //值变化范围
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    );
    //重复执行
    _animationController.repeat();
  }

  @override
  void dispose() {
    //销毁
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //获取当前组件的大小
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      // 允许键盘弹出布局文件上移
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.yellow,
      // 填充布局
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // 剪切自定义
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child){
                return ClipPath(
                  clipper: CustomHeaderClipPath(_animationController.value),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                );
            }),


          ],
        ),
      ),
    );
  }
}

class CustomHeaderClipPath  extends CustomClipper<Path>{
  double progress;
  CustomHeaderClipPath(this.progress);
  // 定义裁剪规则
  @override
  getClip(Size size) {
    // 构建Path
    Path path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height*0.8);

    double controllerCenterx =
      size.width * 0.5 + (size.width*0.6 +1)*sin(progress*pi);
    double controllerCentery = size.height*0.8 + 70*cos(progress*pi);

    // 构建二阶曲线
    path.quadraticBezierTo(
        controllerCenterx,
        controllerCentery,
        size.width,
        size.height*0.8
    );
    path.lineTo(size.width, 0);
    return path;
  }
  // 是否刷新
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}


