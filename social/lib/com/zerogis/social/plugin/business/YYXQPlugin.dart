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
  runApp(new YYXQPlugin());
}

/*
 * 邀约详情页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class YYXQPlugin extends PluginStatefulBase
{
  YYXQPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new YYXQPluginState();
  }

  static String toStrings()
  {
    return "YYXQPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class YYXQPluginState extends PluginBaseState<YYXQPlugin>
{
  void initState()
  {
    super.initState();
    mWindowBackgroundColor = Colors.white;
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context, SingleChildScrollView(child: Column(children: <Widget>[
      CardWidget(),

      Card(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text(
            "相册",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
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
        Text(
            "视频",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
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
        Text(
            "语音",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
        Chip(
          label: Text('15"',),
          avatar: Icon(IconFont.iconlocation, color: Colors.white, size: 20,),
          backgroundColor: Colors.red,
          labelStyle: TextStyle(fontSize: 15, color: APPColorRes.text_color_text4),
          labelPadding: EdgeInsets.only(left: 5, right: 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),),

        Text(
            "主题",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
        Text('推拿',),
        Text(
            "内容",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
        Text('适当的放松会缓解压力 让整个心情很愉快 希望每天都有好心情！',),
        Text(
            "时间",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
        Text('适当的放松会缓解压力 让整个心情很愉快 希望每天都有好心情！',),
        Text(
            "地点",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
        Text('适当的放松会缓解压力 让整个心情很愉快 希望每天都有好心情！',),

        Text(
            "费用",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
        Text('10', style: TextStyle(fontSize: 15, color: Colors.red)),

        Text(
            "补充说明",
            style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text5)),
        Text('适当的放松会缓解压力 让整个心情很愉快 希望每天都有好心情！',),

      ],),),

      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
        Card(
            child: Icon(IconFont.iconweixin, color: Colors.green, size: 40,)),
        Card(
            child: Icon(IconFont.iconxiaoxi, color: Colors.deepPurpleAccent, size: 40,)),
        Card(
            child: Icon(IconFont.iconshipin, color: Colors.deepPurpleAccent, size: 40,)),
      ]),
    ],)));

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
