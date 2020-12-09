// 统一路由的定义与声明
import 'package:Learn/pages/animation/index.dart';
import 'package:Learn/pages/draw/index.dart';
import 'package:Learn/pages/google/14-ListWheelScrollView/index.dart';
import 'package:Learn/pages/google/15-sliver/index.dart';
import 'package:Learn/pages/google/index.dart';
import 'package:Learn/pages/interaction/index.dart';
import 'package:Learn/pages/scroll/index.dart';
import 'package:Learn/pages/ui/index.dart';

import 'package:fluro/fluro.dart';
// 路由文件
import '../pages/firstPage/index.dart' as FirstPage;
import '../pages/404/index.dart';
import '../pages/google/1-safearea/index.dart' as SafeArea;
import '../pages/google/2-expanded/index.dart' as Expanded;
import '../pages/google/3-wrap/index.dart' as Wrap;
import '../pages/google//4-animatedContainer/index.dart' as AnimatedContainer;
import '../pages/google/5-opacity/index.dart' as Opacity;
import '../pages/google/6-pageview/index.dart' as PageView;
import '../pages/google/7-table/index.dart' as Table;
import '../pages/google/8-floatbtn/index.dart' as Fab;
import '../pages/google/9-axpectRadio/index.dart' as AxpectRadio;
import '../pages/google/10-align/index.dart' as Align;
import '../pages/google/11-AppBar/index.dart' as AppBar;
import '../pages/google/12-Jiguang/index.dart' as Jiguang;
import '../pages/google/13-Text/index.dart' as IText;


import '../pages/plug/index.dart';
// Plug
class Routers {
  static void configureRoutes(Router router){
    router.define('/first', handler: Handler(handlerFunc: (ctx, params)=>FirstPage.MyHomePage(),));
    router.define('/1-safearea', handler: Handler(handlerFunc: (ctx, params)=>SafeArea.SafeAreaDemo()));
    router.define("/2-expanded", handler: Handler(handlerFunc: (ctx, params)=>Expanded.ExpandedDemo()));
    router.define('/3-wrap', handler: Handler(handlerFunc: (ctx, params)=>Wrap.WrapDemo()));
    router.define('/4-animatedContainer', handler: Handler(handlerFunc: (ctx, params)=>AnimatedContainer.AnimatedContainderDemo()));
    router.define("/5-opacity", handler: Handler(handlerFunc: (ctx, params)=>Opacity.OpacityDemo()));
    router.define("/6-pageview", handler: Handler(handlerFunc: (ctx, params)=>PageView.PageViewDemo()));
    router.define('/7-table', handler: Handler( handlerFunc: (ctx, params)=>Table.TableDemo()));
    router.define('/8-fab', handler: Handler(handlerFunc: (ctx, params)=>Fab.FloatBtnDemo()));
    router.define('/9-aspectRadio', handler: Handler(handlerFunc: (ctx, params)=>AxpectRadio.AxpectRadioDemo()));
    router.define('/10-align', handler: Handler(handlerFunc: (ctx, params)=>Align.AlignDemo()));
    router.define('/11-AppBar', handler: Handler(handlerFunc: (ctx, params)=>AppBar.AppBarDemo()));
    router.define('/12-Jiguang', handler: Handler(handlerFunc: (ctx, params)=>Jiguang.JiguangPush()));
    router.define('/13-text', handler: Handler(handlerFunc: (ctx, params)=>IText.TextView()));
    router.define('/14-ListWheelScrollView', handler: Handler(handlerFunc: (ctx, params)=>ListSheelScrollViewDemo()));
    router.define('/15-sliver', handler: Handler(handlerFunc: (ctx, params)=>SliverDemos()));

    // 插件
    router.define('/Widgets', handler: Handler(handlerFunc: (ctx, params)=>IWidgets()));
    router.define('/plug', handler: Handler(handlerFunc: (ctx, params)=>PlugIndex()));
    router.define('/ui', handler: Handler(handlerFunc: (ctx, params)=>UIView()));
    router.define('/draw', handler: Handler(handlerFunc: (ctx, params)=>DrawView()));
    router.define('/interaction', handler: Handler(handlerFunc: (ctx, params)=>InteractionView()));
    router.define('/animation', handler: Handler(handlerFunc: (ctx, params)=>AnimationHome()));
    router.define('/scroll', handler: Handler(handlerFunc: (ctx, params)=>ScrollIndex()));

    // 没有匹配到
    router.notFoundHandler = Handler(handlerFunc: (ctx, params)=>Global404());
  }
}

class Application {
  static Router router;
}









