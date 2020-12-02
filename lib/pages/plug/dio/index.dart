
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:bot_toast/bot_toast.dart';

import './utils/request.dart';
/*
*   dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时、自定义适配器等
* */

class PlugDio extends StatefulWidget {
  @override
  _PlugDioState createState() => _PlugDioState();
}


class _PlugDioState extends State<PlugDio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            title('基本使用'),
            RaisedButton(
              child: Text('Use'),
              onPressed: (){
                baseUse();
              },
            ),
            title('封装网络请求'),
            Wrap(
              children: [
                RaisedButton(
                  child: Text('Base'),
                  onPressed: (){
                    getBase();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget title(title){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 22),
      child: Text(title, style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22
      ),),
    );
  }

  void baseUse() async {
    try{
      Response response = await Dio().get('http://123.57.160.114:5666/api/blog/navbar/');
      print(response);
      BotToast.showText(text:"😊 ${response.toString()}");
    } catch (e) {
      print(e);
    }
  }

  // 封装的Get请求
  Future getBase() async{
    Map<String, dynamic> map = new Map();
    map['name'] = 'Taoya';
    map['age'] = 20;

    var json = await DioManager().get(
      url: '/navbara/',
      params: map,
    );
    BotToast.showText(text:"${json}");
  }
}
