import 'package:flutter/material.dart';

/**
 *  使用Flutter能更容易创建好看且不失优秀功能的界面
 * 
 *  PageController它会监听用户的滑动行为并根据该行为提供滑动动画。
 *  
 *  使用PageView和PageController就可以让用户在界面之间随意滚动来浏览他们想看的内容。
 */

class PageViewDemo extends StatefulWidget {
  PageViewDemo({Key key}) : super(key: key);

  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  int _currentPageNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('当前的页面Page ${this._currentPageNum}'),
        backgroundColor: Colors.transparent,
      ),
      body: PageView(
              pageSnapping: true,//是否自动滚动
              scrollDirection: Axis.vertical,
              controller: PageController(//控制器
                initialPage: 0,//使用initialPage来初始页面位置
              ),
              onPageChanged: (currentPage){
                print("当前的页面Page"+"\t"+currentPage.toString());
                setState((){
                  this._currentPageNum = currentPage;
                });
              },
              children: [
                Container(
                  width: 400,
                  height: 200,
                  color: Colors.red
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blue
                ),
              ],
            ),  
    );
  }
}