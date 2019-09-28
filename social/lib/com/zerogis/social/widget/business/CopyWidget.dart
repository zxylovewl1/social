import 'package:flutter/material.dart';
import 'package:zpub_plugin/com/zerogis/zpubPlugin/widget/WidgetStatefulBase.dart';

/*
 * 模板组件 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class CopyWidget extends WidgetStatefulBase
{
  CopyWidget({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new CopyWidgetState();
  }

  static String toStrings()
  {
    return "CopyWidget";
  }
}

/*
 * 组件功能 <br/>
 */
class CopyWidgetState extends WidgetBaseState<CopyWidget>
{
  CopyWidgetState()
  {}

  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = new Container(child: new Text("拷贝"));
    return widget;
  }
}
