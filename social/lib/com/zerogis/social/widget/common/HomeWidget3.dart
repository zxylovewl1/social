import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/plugin/business/SPLTPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/YYXQPlugin.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/core/SysWidgetCreator.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_plugin/com/zerogis/zpubPlugin/widget/WidgetStatefulBase.dart';

/*
 * 主页(框架用例) <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class HomeWidget3 extends WidgetStatefulBase
{
  HomeWidget3({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new HomeWidgetState();
  }

  static String toStrings()
  {
    return "HomeWidget3";
  }
}

/*
 * 页面功能 <br/>
 */
class HomeWidgetState extends WidgetBaseState<HomeWidget3>
{
  /*
   * 组件中的孩子组件
   */
  List<Widget> m_WidgetList;

  void initState()
  {
    super.initState();
    initData();
    m_WidgetList = createChildrenKeyWidget();
  }

  Widget build(BuildContext context)
  {
    return TabBarViewWidget(
        [Tab(text: "关注",), Tab(text: "活跃"), Tab(text: "附近"), Tab(text: "付费"), Tab(text: "接单"),],
        [
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
          SingleChildScrollView(child: Column(
            children: <Widget>[
              XCWidget(),
            ],
          )),
          SingleChildScrollView(child: Column(
            children: <Widget>[
              ListView(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: <Widget>[
                ListItemWidget(),
                ListItemWidget(),
                ListItemWidget(),
                ListItemWidget(),
                ListItemWidget(),
              ],)
            ],
          )),

          SingleChildScrollView(child: Column(
            children: <Widget>[
              ListView(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: <Widget>[
                ListItemWidget(),
                ListItemWidget(),
                ListItemWidget(),
                ListItemWidget(),
                ListItemWidget(),
              ],)
            ],
          )),

        ]);
  }

  void onNetWorkSucceed(String method, Object values)
  {
    if (method == "queryMyTaskMax")
    {

    }
    else
    {
      super.onNetWorkSucceed(method, values);
    }
  }

  void onNetWorkFaild(String method, Object values)
  {
    if (method == "queryHrClockin")
    {

    }
    else
    {
      super.onNetWorkFaild(method, values);
    }
  }

  @override
  Future<void> onRefresh()
  {
    return super.onRefresh();
  }

  @override
  Future<void> loadMore()
  {
    return super.loadMore();
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
      list.add(GestureDetector(child: BGWidget(), onTap: ()
      {
        StateManager.getInstance().startWidegtState(new SPLTPlugin(), this);
      },));
    }
    return new Card(child: new GridView.count(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        padding: EdgeInsets.only(top: 5),
        children: list));
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
class BGWidget extends StatefulWidget
{
  BGWidget({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new BGWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class BGWidgetState extends State<BGWidget>
{
  Widget build(BuildContext context)
  {
    return new Stack(fit: StackFit.expand, alignment: AlignmentDirectional.topCenter, children: <Widget>[
      new Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
        fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
      )),
      Center(child: Icon(IconFont.iconxinbaniconshangchuan_, color: Colors.white, size: 50,),),
      Positioned(right: 5, top: 5, child: Text("#在线#", style: TextStyle(fontSize: 13, color: Colors.white),),),
      Positioned(left: 8, top: 10, child: Icon(IconFont.iconbase_guanbi, color: Colors.white, size: 15,)),
      Positioned(left: 8, bottom: 30, child: Row(children: <Widget>[
        Icon(IconFont.iconlocation, color: Colors.white, size: 13,),
        SizedBox(width: 3,),
        Text("9.2KM", style: TextStyle(fontSize: 13, color: Colors.white),),
      ],),),
      Positioned(left: 5, bottom: 5, child: Text("#有趣的灵魂#", style: TextStyle(fontSize: 13, color: Colors.white),),),
    ],);
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
              borderSide: BorderSide(color: Colors.yellow, width: 3),
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


