import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/plugin/business/YYXQPlugin.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/core/SysWidgetCreator.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new MyFBPlugin());
}

/*
 * 我的发布页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class MyFBPlugin extends PluginStatefulBase
{
  MyFBPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new MyFBPluginState();
  }

  static String toStrings()
  {
    return "MyFBPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class MyFBPluginState extends PluginBaseState<MyFBPlugin>
{
  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        ListView(children: <Widget>[
          ListItemWidget(),
          ListItemWidget(),
          ListItemWidget(),
          ListItemWidget(),
          ListItemWidget(),
        ],));

    return widget;
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
    return GestureDetector(child: Card(child: Container(padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[

          Row(children: <Widget>[
            CircleAvatar(
                radius: MarginPaddingHeightConstant.APP_MARGIN_PADDING_20,
                backgroundImage: new NetworkImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568547148031&di=58f7795361554ed91379f82c57406ff6&imgtype=0&src=http%3A%2F%2Fimg.qqzhi.com%2Fuploads%2F2018-11-29%2F221506411.jpg")),
            SizedBox(width: 10,),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text('小甜甜', style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
              Row(children: <Widget>[
                Text("23岁",),
                SysWidgetCreator.createCommonVerticalDevider(height: 15),
                Text("射手座",),
                SysWidgetCreator.createCommonVerticalDevider(height: 15),
                Text("166cm",),
                SysWidgetCreator.createCommonVerticalDevider(height: 15),
                Text("学生",)
              ]),
            ],)
          ],),

          SizedBox(height: 10,),

          GridView.count(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: [
                Stack(fit: StackFit.expand, alignment: AlignmentDirectional.topCenter, children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
                    fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
                  )),
                  Center(child: Icon(IconFont.iconxinbaniconshangchuan_, color: Colors.white, size: 50,),),
                ],),
                Stack(fit: StackFit.expand, alignment: AlignmentDirectional.topCenter, children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
                    fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
                  )),
                  Center(child: Icon(IconFont.iconxinbaniconshangchuan_, color: Colors.white, size: 50,),),
                ],),
                Stack(fit: StackFit.expand, alignment: AlignmentDirectional.topCenter, children: <Widget>[
                  new Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
                    fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
                  )),
                  Center(child: Icon(IconFont.iconxinbaniconshangchuan_, color: Colors.white, size: 50,),),
                ],),
              ]),

          GridView.count(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
                  fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
                )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
                  fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
                )),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
                  fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
                )),
              ]),

          Text('推拿', style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),

          Text('适当的放松会缓解压力 让整个心情很愉快 希望每天都有好心情！',),

          Chip(
            label: Text('15"',),
            avatar: Icon(IconFont.iconlocation, color: Colors.white, size: 20,),
            backgroundColor: Colors.red,
            labelStyle: TextStyle(fontSize: 15, color: APPColorRes.text_color_text4),
            labelPadding: EdgeInsets.only(left: 5, right: 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),),
        ],))), onTap: ()
    {
      StateManager.getInstance().startWidegtState(new YYXQPlugin(), this);
    },);
  }
}
