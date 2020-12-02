
import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  TextView({Key key}) : super(key: key);

  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {


  @override
  Widget build(BuildContext context) {

    RenderBox box = context.findRenderObject();


    return Scaffold(
      appBar: AppBar(
        title: Text('文本组件'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title('基本文字'),
            Text('这是最基础的文字了'),


            title('文字样式'),
            Text('装饰线：none/lineThrough/overline/underline'),
            Text('装饰线风格：dashed/dotted/double/solid/wavy'),
            Text('Taoya', style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              backgroundColor: Colors.black38,
              letterSpacing: 30,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.wavy
            ),),

            title('textAlign文本对其方式'),
            Container(
              width: 200,
              height: 60,
              color: Colors.blue,
              child: ListView(
                children: [
                  Text('Hi', textAlign:TextAlign.right,),
                  Text('Hi', textAlign:TextAlign.center,),
                  Text('Hi', textAlign:TextAlign.start,)
                ],
              )
            ),


            title('softWrap-文本超出换行'),
            Container(
              width: 50,
              height: 90,
              color: Colors.blue,
              child: Text('HiHi~~~...>~.', softWrap: true,),
            ),


            title('过渡颜色的文字'),


            RichText(
              text: TextSpan(
                // style: DefaultTextStyle.of(context).style,
                children: [
                  WidgetSpan(
                    child: Container(
                      margin: EdgeInsets.only(right:  20),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blue
                      ),
                      child: Text('判断题', style: TextStyle(color: Colors.white),),
                    )
                  ),


                  TextSpan(text: '泡沫灭火器可用于带电灭火', style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38
                  )),
                ]
              ),
            ),

            SizedBox(height: 30,),
            Text.rich(
              TextSpan(
                  text: '登录即代表同意并阅读',
                  style: TextStyle(fontSize: 11, color: Color(0xFF999999)),
                  children: [
                    TextSpan(
                      text: '《服务协议》',
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                      // recognizer: TapGestureRecognizer()
                    ),
                  ]),
            ),


          ],
        ),
      ),
    );
  }

  Widget title(text){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 22),
      child: Text(text, style: TextStyle(
        fontWeight: FontWeight.bold,
      ),),
    );
  }



  
}