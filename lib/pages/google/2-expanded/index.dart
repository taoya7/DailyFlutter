import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Demo"),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          /**
           *  行列 用Row 或者 Column组件
           * 他们可以让子项目紧凑的排列在一起。也可以将他们平铺。如果你想要一个子项拉伸并填充剩余空间呢？
           * 
           * 也可以设置flex以防竞争
           */
            Text("两边固定中间自适应"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                  getBox(),
                  Expanded( // 中间填充
                    child:Container(
                      height: 20,
                      color: Colors.red,
                    ),
                  ),
                  getBox(),
              ],
            ),

            SizedBox(
              height: 50,
            ),


          // 使用flex
            Text("3:7按比例"),
            Row(
              children: [
                getBox(),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 20,
                    color: Colors.red
                  ),
                ),
                getBox(),
                Expanded(
                  flex: 7, 
                  child: Container(
                    height: 20,
                    color: Colors.red
                ))
              ],
            )
        ],  
      ),
    );
  }

  Widget getBox(){
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue
    );
  }
}