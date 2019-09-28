import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/resource/ColorRes.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new CZPlugin());
}

/*
 * 充值页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class CZPlugin extends PluginStatefulBase
{
  CZPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new CZPluginState();
  }

  static String toStrings()
  {
    return "CZPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class CZPluginState extends PluginBaseState<CZPlugin>
{
  bool _checkBox = true;

  void initState()
  {
    super.initState();
    mWindowBackgroundColor = Colors.white;
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 10), child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(
                text: '充值金额\t\t\t',
                style: TextStyleRes.text_color_text1_larger,
                children: [
                  new TextSpan(
                      text: '咨询电话：4008886884', style: TextStyleRes.text_color_text1_small)
                ])),
            Divider(),

            ListView(

                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Card(child: Column(children: <Widget>[
                    Align(alignment: Alignment.topRight,
                      child: Container(color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('限时折扣', style: TextStyle(fontSize: 15, color: Colors.white)),),),


                    Padding(padding: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text('送1加1钻石', style: TextStyle(fontSize: 20, color: ColorRes.text_color_text1),),

                      Row(children: <Widget>[
                        Text('1元', style: TextStyle(
                            fontSize: 15, color: ColorRes.text_color_text1, decoration: TextDecoration.lineThrough),),
                        SizedBox(width: 10,),
                        Text('0.5元', style: TextStyle(
                            fontSize: 28, color: ColorRes.text_color_text1, fontWeight: FontWeight.w900),),
                      ],)
                    ],),),
                  ],)),


                  Card(child: Column(children: <Widget>[
                    Align(alignment: Alignment.topRight,
                      child: Container(color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('限时折扣', style: TextStyle(fontSize: 15, color: Colors.white)),),),


                    Padding(padding: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text('送6加6钻石', style: TextStyle(fontSize: 20, color: ColorRes.text_color_text1),),

                      Row(children: <Widget>[
                        Text('6元', style: TextStyle(
                            fontSize: 15, color: ColorRes.text_color_text1, decoration: TextDecoration.lineThrough),),
                        SizedBox(width: 10,),
                        Text('3元', style: TextStyle(
                            fontSize: 28, color: ColorRes.text_color_text1, fontWeight: FontWeight.w900),),
                      ],)
                    ],),),
                  ],)),


                  Card(child: Column(children: <Widget>[
                    Align(alignment: Alignment.topRight,
                      child: Container(color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('限时折扣', style: TextStyle(fontSize: 15, color: Colors.white)),),),


                    Padding(padding: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text('送50加50钻石', style: TextStyle(fontSize: 20, color: ColorRes.text_color_text1),),

                      Row(children: <Widget>[
                        Text('30元', style: TextStyle(
                            fontSize: 15, color: ColorRes.text_color_text1, decoration: TextDecoration.lineThrough),),
                        SizedBox(width: 10,),
                        Text('15元', style: TextStyle(
                            fontSize: 28, color: ColorRes.text_color_text1, fontWeight: FontWeight.w900),),
                      ],)
                    ],),),
                  ],)),

                  Card(child: Column(children: <Widget>[
                    Align(alignment: Alignment.topRight,
                      child: Container(color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('限时折扣', style: TextStyle(fontSize: 15, color: Colors.white)),),),


                    Padding(padding: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text('送100加140钻石', style: TextStyle(fontSize: 20, color: ColorRes.text_color_text1),),

                      Row(children: <Widget>[
                        Text('108元', style: TextStyle(
                            fontSize: 15, color: ColorRes.text_color_text1, decoration: TextDecoration.lineThrough),),
                        SizedBox(width: 10,),
                        Text('54元', style: TextStyle(
                            fontSize: 28, color: ColorRes.text_color_text1, fontWeight: FontWeight.w900),),
                      ],)
                    ],),),
                  ],)),


                  Card(child: Column(children: <Widget>[
                    Align(alignment: Alignment.topRight,
                      child: Container(color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('限时折扣', style: TextStyle(fontSize: 15, color: Colors.white)),),),


                    Padding(padding: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text('送300加350钻石', style: TextStyle(fontSize: 20, color: ColorRes.text_color_text1),),

                      Row(children: <Widget>[
                        Text('500元', style: TextStyle(
                            fontSize: 15, color: ColorRes.text_color_text1, decoration: TextDecoration.lineThrough),),
                        SizedBox(width: 10,),
                        Text('249元', style: TextStyle(
                            fontSize: 28, color: ColorRes.text_color_text1, fontWeight: FontWeight.w900),),
                      ],)
                    ],),),
                  ],)),


                  Card(child: Column(children: <Widget>[
                    Align(alignment: Alignment.topRight,
                      child: Container(color: Colors.redAccent,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text('限时折扣', style: TextStyle(fontSize: 15, color: Colors.white)),),),


                    Padding(padding: EdgeInsets.only(bottom: 20, top: 5, left: 5, right: 5), child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text('送800加740钻石', style: TextStyle(fontSize: 20, color: ColorRes.text_color_text1),),

                      Row(children: <Widget>[
                        Text('1000元', style: TextStyle(
                            fontSize: 15, color: ColorRes.text_color_text1, decoration: TextDecoration.lineThrough),),
                        SizedBox(width: 10,),
                        Text('500元', style: TextStyle(
                            fontSize: 28, color: ColorRes.text_color_text1, fontWeight: FontWeight.w900),),
                      ],)
                    ],),),
                  ],)),

                ]),

            SizedBox(height: 10, width: ScreenUtil
                .getInstance()
                .screenWidth, child: Container(color: ColorRes.windowBackground,),),
            Text('充值方式', style: TextStyleRes.text_color_text1_larger,),

            WeCells(children: <Widget>[
              WeCell(
                label: Row(
                    children: <Widget>[
                      Padding(
                          child: Icon(
                            IconFont.iconzhifubao, size: 30, color: Colors.blue,),
                          padding: EdgeInsets.only(right: 10)
                      ),
                      Text('支付宝')
                    ]
                ),
                content: Checkbox(value: _checkBox, onChanged: (value)
                {
                  setState(()
                  {
                    if (!_checkBox)
                    {
                      _checkBox = value;
                    }
                  });
                }),
              ),

              WeCell(
                label: Row(
                    children: <Widget>[
                      Padding(
                          child: Icon(
                            IconFont.iconweixin, size: 30, color: Colors.blue,),
                          padding: EdgeInsets.only(right: 10)
                      ),
                      Text('微信')
                    ]
                ),
                content: Checkbox(value: !_checkBox, onChanged: (value)
                {
                  setState(()
                  {
                    if (value)
                    {
                      _checkBox = !value;
                    }
                  });
                }),
              ),

              Center(child: Text('充值须知', style: TextStyle(fontSize: 20, color: APPColorRes.text_color_text1),),),

              Text('建议充值足额，诚意金可退回平台账户，诚意金越高优质服务者应邀越多越快。', style: TextStyle(fontSize: 15, color: Colors.red),),
              Text('服务者匹配顺序遵循诚意金价格优先和时间优先原则。', style: TextStyle(fontSize: 15, color: Colors.red),),
              Text('点击"确认充值",即同意《充值协议条款》请咨询1250393285@qq.com。'),

              Container(width:ScreenUtil.getInstance().screenWidth,margin: EdgeInsets.symmetric(vertical: 40),child: RaisedButton(onPressed:
                  ()
              {

              }, child: new Text('确认'), color: Colors.red,padding: EdgeInsets.symmetric(vertical: 15),)),


            ],)
          ],
        ))
    );

    return widget;
  }

  void onClick(Widget widget)
  {

  }
}
