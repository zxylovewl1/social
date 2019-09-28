import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/core/SysWidgetCreator.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new JYPlugin());
}

/*
 * 交友页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class JYPlugin extends PluginStatefulBase
{
  JYPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new JYPluginState();
  }

  static String toStrings()
  {
    return "JYPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class JYPluginState extends PluginBaseState<JYPlugin>
{

  void initState()
  {
    super.initState();
    mWindowBackgroundColor = Colors.white;
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context, Column(children: <Widget>[
      CardWidget(),

      Flexible(
        child: TabBarViewWidget(
            [Tab(text: "资料",), Tab(text: "相册"), Tab(text: "视频"),],
            [
              SingleChildScrollView(child: Column(
                children: <Widget>[
                  ZLWidget(),
                ],
              )),
              SingleChildScrollView(child: Column(
                children: <Widget>[
                  XCWidget(),
                ],
              )),
              SingleChildScrollView(child: Column(
                children: <Widget>[
                  XCWidget(),
                ],
              )),
            ]),),

      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
        Card(
            child: Icon(IconFont.iconweixin, color: Colors.green, size: 40,)),
        Card(
            child: Icon(IconFont.iconxiaoxi, color: Colors.deepPurpleAccent, size: 40,)),
        Card(
            child: Icon(IconFont.iconshipin, color: Colors.deepPurpleAccent, size: 40,)),
      ]),
    ],));

    return widget;
  }
}

/*
 * 类描述：卡片组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class CardWidget extends StatefulWidget
{
  CardWidget({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new CardWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class CardWidgetState extends State<CardWidget>
{
  Widget build(BuildContext context)
  {
    return new Card(child: new Column(
      children: <Widget>[
        new WeSwipe(
            width: ScreenUtil
                .getInstance()
                .screenWidth,
            height: ScreenUtil.getInstance().getHeight(MarginPaddingHeightConstant.APP_MARGIN_PADDING_200),
            autoPlay: false,
            itemCount: 1,
            indicators: false,
            itemBuilder: (index)
            {
              return WidgetCreator.createCommonImage(
                "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3505225179,3679565771&fm=26&gp=0.jpg",
                fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
              );
            }
        ),
        Padding(child: new Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                child: Text(
                    "小甜甜", style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5, fontFamily: 'iconfont')),
                flex: DigitValueConstant.APP_DIGIT_VALUE_5,
              ),
              new Flexible(
                child: DecorationButton(),
                flex: DigitValueConstant.APP_DIGIT_VALUE_1,
              ),
            ],),
          Row(children: <Widget>[
            Text("23岁",),
            SysWidgetCreator.createCommonVerticalDevider(height: 15),
            Text("射手座",),
            SysWidgetCreator.createCommonVerticalDevider(height: 15),
            Text("166cm",),
            SysWidgetCreator.createCommonVerticalDevider(height: 15),
            Text("学生",),
            SysWidgetCreator.createCommonVerticalDevider(height: 15),
            Text("小于10W",)
          ]),
          Row(children: <Widget>[
            Chip(avatar: Icon(IconFont.iconxueyuan), label: Text("华中科技大学"), backgroundColor: Colors.white,),
            Text("本科"),
          ]),
        ],), padding: EdgeInsets.all(10),)
      ],
    ));
  }
}


/*
 * 类描述：资料组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class ZLWidget extends StatefulWidget
{
  ZLWidget({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new ZLWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class ZLWidgetState extends State<ZLWidget>
{
  String value = "1、 我不知道月亮能不能代表我的心，但我告诉你我真的爱你！爱你有多深，我找不到标准来衡量，但我向你保证时间可以见证我爱你一生一世！"
      "\n\n 2、 一岁嘴角流瀑布，两岁穿衣不穿裤，三岁鼻涕流进嘴，四岁夜里长梦鬼，此人年少没出息，长大以后智商低，明知说的就是你，还要坚持看到底，佩服，佩服啊！：）"
      "\n\n 3、 一起老去的日子里，因为朋友的存在而泛着七彩的光。"
      "\n\n 4、 情之最可珍贵者，莫过真诚；爱之最可称扬者，莫过无私。"
      "\n\n 5、 愿冬季的大雪，覆盖你所有纷繁困扰，漫天的雪花，能飘尽你所有哀愁与悲伤，让我的爱在这寒冷冬季带给你最贴心的暖意！";

  Widget build(BuildContext context)
  {
    return
      new Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Chip(avatar: Container(
          height: 30,
          width: 10,
          color: Colors.blue.withOpacity(0.5),
          margin: const EdgeInsets.only(left: 10.0, right: 5),
        ),
          label: Text("关于我"),
          labelStyle: TextStyle(
              fontSize: 17,
              color: APPColorRes.text_color_text5,
              fontWeight: FontWeight.w900,
              fontFamily: 'iconfont'),
          backgroundColor: Colors.white,),
        Text(value),


        Chip(avatar: Container(
          height: 30,
          width: 10,
          color: Colors.blue.withOpacity(0.5),
          margin: const EdgeInsets.only(left: 10.0, right: 5),
        ),
          label: Text("兴趣爱好"),
          labelStyle: TextStyle(
              fontSize: 17,
              color: APPColorRes.text_color_text5,
              fontWeight: FontWeight.w900,
              fontFamily: 'iconfont'),
          backgroundColor: Colors.white,),
        Text(value),


        Chip(avatar: Container(
          height: 30,
          width: 10,
          color: Colors.blue.withOpacity(0.5),
          margin: const EdgeInsets.only(left: 10.0, right: 5),
        ),
          label: Text("感情观"),
          labelStyle: TextStyle(
              fontSize: 17,
              color: APPColorRes.text_color_text5,
              fontWeight: FontWeight.w900,
              fontFamily: 'iconfont'),
          backgroundColor: Colors.white,),
        Text(value),


        Chip(avatar: Container(
          height: 30,
          width: 10,
          color: Colors.blue.withOpacity(0.5),
          margin: const EdgeInsets.only(left: 10.0, right: 5),
        ),
          label: Text("心仪的TA"),
          labelStyle: TextStyle(
              fontSize: 17,
              color: APPColorRes.text_color_text5,
              fontWeight: FontWeight.w900,
              fontFamily: 'iconfont'),
          backgroundColor: Colors.white,),
        Text(value),

      ],),);
  }
}

/*
 * 类描述：相册组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class XCWidget extends StatefulWidget
{
  XCWidget({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new XCWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class XCWidgetState extends State<XCWidget>
{
  Widget build(BuildContext context)
  {
    List<Widget> list = new List();
    for (int i = 0; i < 10; i ++)
    {
      list.add(new Padding(padding: EdgeInsets.all(3), child: WidgetCreator.createCommonImage(
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3505225179,3679565771&fm=26&gp=0.jpg",
        fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
      )));
      list.add(new Padding(padding: EdgeInsets.all(3), child: WidgetCreator.createCommonImage(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
        fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
      )));
    }
    return new Card(child: new GridView.count(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
        children: list));
  }
}


/*
 * 类描述：关注渐变组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class DecorationButton extends StatefulWidget
{
  DecorationButton({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new DecorationButtonWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class DecorationButtonWidgetState extends State<DecorationButton>
{
  Widget build(BuildContext context)
  {
    return RaisedButton(
      onPressed: ()
      {},
      textColor: Colors.white,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22.0))),
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xff25D1D1),
              Color(0xff3BE6AD),
              Color(0xff20DDAA)
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Container(
            alignment: Alignment.center,
            child: Text('关注')),
      ),
    );
  }
}


/*
 * 类描述：滑动组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class TabBarViewWidget extends StatefulWidget
{
  List<Widget> tabs = [];
  List<Widget> tabsView = [];

  TabBarViewWidget(this.tabs, this.tabsView, {Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new TabBarViewWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class TabBarViewWidgetState extends State<TabBarViewWidget>
    with TickerProviderStateMixin
{
  TabController _controller;

  @override
  void initState()
  {
    _controller = TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar(
          controller: _controller,
          isScrollable: true,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 17),
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 3),
              insets: EdgeInsets.symmetric(horizontal: 15)
          ),
          tabs: widget.tabs,
        ),
        Divider(height: 1, color: Colors.grey.withOpacity(0.5)),
        Flexible(child: TabBarView(controller: _controller, children: widget.tabsView)),
      ],
    );
  }
}

