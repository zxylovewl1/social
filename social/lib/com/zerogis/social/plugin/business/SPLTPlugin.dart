import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new SPLTPlugin());
}

/*
 * 视频聊天页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class SPLTPlugin extends PluginStatefulBase
{
  SPLTPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new SPLTPluginState();
  }

  static String toStrings()
  {
    return "SPLTPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class SPLTPluginState extends PluginBaseState<SPLTPlugin>
{
  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context, Stack(
      children: <Widget>[
        Opacity(opacity: 0.5, child: Container(width: ScreenUtil
            .getInstance()
            .screenWidth, height: ScreenUtil
            .getInstance()
            .screenHeight, child: WidgetCreator.createCommonImage(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569125963461&di=93fd6803f47a4b85b93c1a1aa43473cf&imgtype=0&src=http%3A%2F%2Fww2.sinaimg.cn%2Flarge%2F85cccab3gw1etdd38izvtg20dw06ywse.jpg",
          fit: BoxFit.fitHeight,
          alignment: Alignment.center,
        ))),

        Center(child: WidgetCreator.createCommonImage(
          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1569125963461&di=93fd6803f47a4b85b93c1a1aa43473cf&imgtype=0&src=http%3A%2F%2Fww2.sinaimg.cn%2Flarge%2F85cccab3gw1etdd38izvtg20dw06ywse.jpg",
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),),

        Align(
            alignment: Alignment.topRight,
            child: Padding(
              child: Chip(backgroundColor: Colors.white, label: Text('关注'), avatar: CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2121826377,2443054201&fm=26&gp=0.jpg")),),
              padding: EdgeInsets.only(right: 10, top: 10),)),

        Padding(child: Align(alignment: Alignment.bottomCenter, child: RaisedButton(
          onPressed: ()
          {
            showToast("正在开发中");
          },
          child: Chip(label: Text('视频聊天'),
            avatar: Icon(IconFont.iconshipin),
            backgroundColor: Colors.yellowAccent.withOpacity(1),),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(28.0)),
          splashColor: Colors.white,
          color: Colors.yellowAccent,
        ),), padding: EdgeInsets.only(bottom: 30),)
      ],
    ));

    return widget;
  }
}
