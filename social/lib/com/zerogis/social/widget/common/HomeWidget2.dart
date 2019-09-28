import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';
import 'package:social/com/zerogis/social/widget/core/CommonWidgetCreator.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
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
class HomeWidget2 extends WidgetStatefulBase
{
  HomeWidget2({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new HomeWidgetState();
  }

  static String toStrings()
  {
    return "HomeWidget2";
  }
}

/*
 * 页面功能 <br/>
 */
class HomeWidgetState extends WidgetBaseState<HomeWidget2>
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
    return createCommonRefresh(new Column(
      children: <Widget>[
        GestureDetector(child: CardWidget(), onTap: ()
        {
          PluginsFactory.getInstance().get("JYPlugin").runPlugin(this);
        },),
        SysWidgetCreator.createCommonSizedBox(height: ScreenUtil.getInstance().getHeight(5)),
        new Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
          CommonWidgetCreator.createCommonTopImgText({'title': '喜欢', 'icon': '0xe652'}),
          CommonWidgetCreator.createCommonTopImgText({'title': '不喜欢', 'icon': '0xe603'}),
          CommonWidgetCreator.createCommonTopImgText({'title': '满意', 'icon': '0xe654'}),
          CommonWidgetCreator.createCommonTopImgText({'title': '一般', 'icon': '0xe77a'}),
        ],),
      ],
    ));
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
        Padding(child: new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[

          new Flexible(
            child: new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
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
              Row(children: <Widget>[
                Chip(avatar: Icon(IconFont.iconxueyuan), label: Text("华中科技大学"), backgroundColor: Colors.white,),
                Text("本科"),
              ]),
            ],),
            flex: DigitValueConstant.APP_DIGIT_VALUE_1,
          ),
          GestureDetector(child: new CircleAvatar(
              radius: MarginPaddingHeightConstant.APP_MARGIN_PADDING_50,
              backgroundImage: new NetworkImage(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568547148031&di=58f7795361554ed91379f82c57406ff6&imgtype=0&src=http%3A%2F%2Fimg.qqzhi.com%2Fuploads%2F2018-11-29%2F221506411.jpg")),
            onTap: ()
            {

            },),
        ],), padding: EdgeInsets.all(10),)
      ],
    ));
  }
}



