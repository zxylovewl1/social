import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new QBPlugin());
}

/*
 * 钱包页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class QBPlugin extends PluginStatefulBase
{
  QBPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new QBPluginState();
  }

  static String toStrings()
  {
    return "QBPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class QBPluginState extends PluginBaseState<QBPlugin>
{
  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        GridView.count(padding: EdgeInsets.all(10), crossAxisCount: 2, children: <Widget>[

          GestureDetector(child: Container(
            margin: EdgeInsets.all(5), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Chip(label: Text('我的充值'),
              avatar: Icon(IconFont.iconqianbao, color: Colors.redAccent,),
              backgroundColor: Colors.white,),
            Text('0.00', style: TextStyleRes.text_color_text1_larger_fontw900,),
            Chip(label: Text('充值'), backgroundColor: Colors.red,),
          ],), color: Colors.white,), onTap: ()
          {
            runPluginName('CZPlugin');
          },),

          GestureDetector(child: Container(
            margin: EdgeInsets.all(5), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Chip(
              label: Text('钻石'),
              avatar: Icon(IconFont.iconqianbao, color: Colors.redAccent),
              backgroundColor: Colors.white,),
            Text('0', style: TextStyleRes.text_color_text1_larger_fontw900),
            Chip(label: Text('充值'), backgroundColor: Colors.red,),
          ],), color: Colors.white,), onTap: ()
          {
            runPluginName('CZPlugin');
          },)

        ],));

    return widget;
  }

  void onClick(Widget widget)
  {

  }
}
