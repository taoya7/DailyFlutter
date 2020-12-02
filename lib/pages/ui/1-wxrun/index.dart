import 'dart:convert';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WxMotionTopPage extends StatefulWidget {
  @override
  _WxMotionTopPageState createState() => _WxMotionTopPageState();
}

/*
*   微信排行榜
* */
class _WxMotionTopPageState extends State<WxMotionTopPage> {
  ScrollController _scrollController = ScrollController();

  double _imgNormalHeight = 300;
  double _imgExtraHeight = 0;
  double _imgChangeHeight = 0;
  double _scrollMinOffSet = 0;
  double _navH = 0;
  double _appbarOpacity = 0.0;
  var _dataArr = [];


  @override
  void initState() {
    super.initState();
    _addListener();
    _loadData();
  }

  @override
  void dispose() {
    // 为了避免内存泄漏
    _scrollController.dispose();
    super.dispose();
  }
  void _loadData() async {
    final jsonStr = await rootBundle.loadString('lib/pages/ui/1-wxrun/data.json');
    Map obj = json.decode(jsonStr);
    List dataArr = obj['data'];
    dataArr.forEach( (item){
      print(item);
      if( item['isOwn'] == true ){
        dataArr.remove(item);
        dataArr.insert(0, item);
      }
    });
    _dataArr = dataArr;
    setState(() {});
  }
  void _addListener(){
    _scrollController.addListener(() {
      double _y = _scrollController.offset;
      print("滑动距离：${_y}");

      if(_y < _scrollMinOffSet){
        _imgExtraHeight = -_y;
        setState(() {
          _imgChangeHeight = _imgNormalHeight + _imgExtraHeight;
        });
      }else{
        setState(() {
          _imgChangeHeight = _navH;
        });
      }
      // appBar透明度
      double appBarOpacity = _y / _navH;
      if (appBarOpacity < 0) {
        appBarOpacity = 0.0;
      } else if (appBarOpacity > 1) {
        appBarOpacity = 1.0;
      }

      //更新透明度
      setState(() {
        _appbarOpacity = appBarOpacity;
        // print('_appbarO: ${_appbarOpacity}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context, _dataArr),
    );
  }

  Widget _body(context, dataArr){
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              controller: _scrollController,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: dataArr.length + 1,
              itemBuilder: (BuildContext context, int index){
                if(index == 0){
                  return Container(
                    width: double.infinity,
                    height: _imgNormalHeight,
                    color: Color(0xff696969),
                  );
                }
                return _cell(context, dataArr[index -1]);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _cell(context, item){
    return InkWell(
      onTap: ()=> _clickCell(context, item['name']),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 12,
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      item['isOwn'] ? '' : (item['id']+1).toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Expanded(
                  flex: 75,
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(
                        child: Text(item['name'].substring(0, 1), style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                      ),
                    ),
                    title: Text(item['name'], style: TextStyle(
                      fontSize: 16
                    ),),
                    trailing: Text(
                      item['steps'].toString(),
                      style: TextStyle(
                        fontSize: 28,
                        color: item['steps'] > 10000 ? Colors.orange : Colors.green
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['starNum'].toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5,),
                      InkWell(
                        child: Icon(
                          Icons.favorite,
                          color: item['isStar'] ? Colors.red : Colors.grey,
                        ),
                        onTap: (){
                          // 点赞👍
                          setState(() {
                            item['isStar'] = !item['isStar'];
                            if(item['isStar']){
                              item['starNum']++;
                            }else{
                              item['starNum']--;
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              color: Color(0xffF5F5F5),
              height: item['isOwn'] ? 10:1,
            )
          ],
        ),
      ),
    );
  }
  _clickCell(context, text){
    BotToast.showText(text: '${text}');
  }
}
