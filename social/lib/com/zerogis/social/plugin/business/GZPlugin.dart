import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/core/SysWidgetCreator.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new GZPlugin());
}

/*
 * 我的关注界面页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class GZPlugin extends PluginStatefulBase
{
  GZPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new GZPluginState();
  }

  static String toStrings()
  {
    return "GZPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class GZPluginState extends PluginBaseState<GZPlugin>
{
  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(context, SingleChildScrollView(child: Column(children: <Widget>[
      ListView(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: <Widget>[
        GestureDetector(child: ListItemWidget(), onTap: ()
        {
          runPluginName("JYPlugin");
        },),
        GestureDetector(child: ListItemWidget(), onTap: ()
        {
          runPluginName("JYPlugin");
        },),
        GestureDetector(child: ListItemWidget(), onTap: ()
        {
          runPluginName("JYPlugin");
        },),
        GestureDetector(child: ListItemWidget(), onTap: ()
        {
          runPluginName("JYPlugin");
        },),
        GestureDetector(child: ListItemWidget(), onTap: ()
        {
          runPluginName("JYPlugin");
        },),
        GestureDetector(child: ListItemWidget(), onTap: ()
        {
          runPluginName("JYPlugin");
        },),
      ],),

      SizedBox(height: 30,),
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Column(children: <Widget>[
          Text('为您推荐', style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text1),),

          ListView(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: createListViewItem(),),
        ],),),

    ],),));
    return widget;
  }

  List<Widget> createListViewItem()
  {
    List<Widget> list_tile = new List();
    for (int i = 0; i < 10; i ++)
    {
      list_tile.add(
          GestureDetector(child: ListTJItemWidget(), onTap: ()
          {
            runPluginName("JYPlugin");
          },));
    }
    return ListTile.divideTiles(context: context, tiles: list_tile).toList();
  }
}


/*
 * 类描述：关注条目组件
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
      Row(children: <Widget>[
        Flexible(child: Row(children: <Widget>[
          CircleAvatar(
              radius: MarginPaddingHeightConstant.APP_MARGIN_PADDING_40,
              backgroundImage: new NetworkImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg")),
          SizedBox(width: 15,),

          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Text(
                "小甜甜",
                style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5, fontFamily: 'iconfont')),

            Row(children: <Widget>[
              Text("23岁",),
              SysWidgetCreator.createCommonVerticalDevider(height: 15),
              Text("射手座",),
              SysWidgetCreator.createCommonVerticalDevider(height: 15),
              Text("166cm",),
              SysWidgetCreator.createCommonVerticalDevider(height: 15),
              Text("学生",)
            ]),
          ],),
        ],),),
      ],),
    ],));
  }
}


/*
 * 类描述：关注条目组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class ListTJItemWidget extends StatefulWidget
{
  ListTJItemWidget({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new ListTJItemWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class ListTJItemWidgetState extends State<ListTJItemWidget>
{
  Widget build(BuildContext context)
  {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Row(children: <Widget>[
          Flexible(child: Row(children: <Widget>[
            CircleAvatar(
                radius: MarginPaddingHeightConstant.APP_MARGIN_PADDING_40,
                backgroundImage: new NetworkImage(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg")),
            SizedBox(width: 15,),

            Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              Text(
                  "小甜甜",
                  style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5, fontFamily: 'iconfont')),


              Row(children: <Widget>[
                Text("23岁",),
                SysWidgetCreator.createCommonVerticalDevider(height: 15),
                Text("166cm",),
                SysWidgetCreator.createCommonVerticalDevider(height: 15),
                Text("学生",)
              ]),


            ],),
          ],),),

          Padding(child: WeButton('关注', theme: WeButtonType.primary, size: WeButtonSize.mini,),
            padding: EdgeInsets.only(right: 15),)
        ],),
      ],),
      onTap: ()
      {},
    );
  }
}
