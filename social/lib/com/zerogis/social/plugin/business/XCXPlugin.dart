import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new XCXPlugin());
}

/*
 * 小程序界页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class XCXPlugin extends PluginStatefulBase
{
  XCXPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new XCXPluginState();
  }

  static String toStrings()
  {
    return "XCXPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class XCXPluginState extends PluginBaseState<XCXPlugin>
{
  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(context, ListView(children: <Widget>[
      ListItemWidget(),
      ListItemWidget(),
      ListItemWidget(),
      ListItemWidget(),
      ListItemWidget(),
      ListItemWidget(),
    ],));
    return widget;
  }

  void onClick(Widget widget)
  {

  }
}


/*
 * 类描述：付费接单组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class ListItemWidget extends StatefulWidget
{
  ListItemWidget({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new ListItemWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class ListItemWidgetState extends State<ListItemWidget>
{
  Widget build(BuildContext context)
  {
    return Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      GridView.count(
          shrinkWrap: true,
          physics: new NeverScrollableScrollPhysics(),
          crossAxisCount: 1,
          children: [
            Stack(fit: StackFit.expand, alignment: AlignmentDirectional.topCenter, children: <Widget>[
              new Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
                fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
              )),
              Center(child: Icon(IconFont.iconxinbaniconshangchuan_, color: Colors.white, size: 50,),),
            ],),
          ]),


      Row(children: <Widget>[
        Flexible(child: Row(children: <Widget>[
          CircleAvatar(
              radius: MarginPaddingHeightConstant.APP_MARGIN_PADDING_30,
              backgroundImage: new NetworkImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg")),
          SizedBox(width: 15,),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text('经典扫雷', style: TextStyle(fontSize: 18, color: APPColorRes.text_color_text5)),
            SizedBox(height: 10,),
            Text('经典扫雷', style: TextStyle(color: APPColorRes.text_color_text1)),
          ],),
        ],),),

        Padding(child: WeButton('打开', theme: WeButtonType.primary, size: WeButtonSize.mini,),
          padding: EdgeInsets.only(right: 15),)
      ],),
    ],));
  }
}

