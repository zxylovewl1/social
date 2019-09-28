import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/constant/PluginInitParamKeyConstant.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:social/com/zerogis/social/widget/core/CommonWidgetCreator.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/core/SysWidgetCreator.dart';
import 'package:zpub_plugin/com/zerogis/zpubPlugin/widget/WidgetStatefulBase.dart';

/*
 * 主页(框架用例) <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class HomeWidget4 extends WidgetStatefulBase
{
  HomeWidget4({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new HomeWidgetState();
  }

  static String toStrings()
  {
    return "HomeWidget4";
  }
}

/*
 * 页面功能 <br/>
 */
class HomeWidgetState extends WidgetBaseState<HomeWidget4>
{
  List<dynamic> _mList;

  void initState()
  {
    super.initState();
    _mList = mInitParaMap[MapKeyConstant.MAP_KEY_LIST];
  }

  Widget build(BuildContext context)
  {
    return createCommonRefresh(new SingleChildScrollView(
        child: Column(children: <Widget>[
          new Container(
              height: MarginPaddingHeightConstant.APP_MARGIN_PADDING_232,
              child:
              new Stack(
                children: <Widget>[
                  new WeSwipe(
                      height: MarginPaddingHeightConstant.APP_MARGIN_PADDING_232,
                      autoPlay: false,
                      itemCount: 1,
                      indicators: false,
                      itemBuilder: (index)
                      {
                        return WidgetCreator.createCommonImage(
                          mInitParaMap[PluginInitParamKeyConstant
                              .PLUGIN_INIT_PARAM_MAIN_KEY_IMAGE_URL],
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter,
                        );
                      }
                  ),
                  new Align(
                      child: new Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                        new GestureDetector(child: new CircleAvatar(
                            radius: MarginPaddingHeightConstant.APP_MARGIN_PADDING_50,
                            backgroundImage: new NetworkImage(
                                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg")),
                          onTap: ()
                          {
                            runPluginName('MemberInfoPlugin');
                          },),
                        new Text("小甜甜", style: TextStyleRes.text_color_text4_larger,),
                      ],)
                  )
                ],
              )),
          new Card(
              margin: const EdgeInsets.only(left: 19, right: 19, top: 20),
              child: new WeCells(
                  children: createCellWidget())),

          SizedBox(height: 30,),
          Text('为您推荐附近服务者'),
          createGridView(),
        ],)
    ));
  }

  /*
   * 创建cell的表格
   */
  List<Widget> createCellWidget()
  {
    List<Widget> list = <Widget>[];
    _mList.forEach((map)
    {
      list.add(CommonWidgetCreator.createCommonLeftImgText(map, size: 40, onClick: ()
      {
        if (map['plugin'] == 'WebViewPlugin')
        {
          mChildUniversalInitPara = map['webview'];
          runPluginName(map[MapKeyConstant.MAP_KEY_PLUGIN]);
        }
        else
        {
          runPluginName(map[MapKeyConstant.MAP_KEY_PLUGIN]);
        }
      }));
    });
    return list;
  }

  @override
  Future<void> onRefresh()
  {
    return super.onRefresh();
  }


  Widget createGridView()
  {
    List<Widget> list = new List();
    for (int i = 0; i < 10; i ++)
    {
      list.add(GridItemWidget());
    }

    return GridView.count(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        children: list);
  }
}

/*
 * 类描述：推荐组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class GridItemWidget extends StatefulWidget
{
  GridItemWidget({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new GridItemWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class GridItemWidgetState extends State<GridItemWidget>
{
  Widget build(BuildContext context)
  {
    return new Stack(fit: StackFit.expand, alignment: AlignmentDirectional.topCenter, children: <Widget>[
      new Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: WidgetCreator.createCommonImage(
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568545668662&di=9c4b57b0cbd71b53e63862dcafd2d49a&imgtype=0&src=http%3A%2F%2Fd-pic-image.yesky.com%2F1080x-%2FuploadImages%2F2019%2F044%2F59%2F1113V6L3Q6TY.jpg",
        fit: BoxFit.fitWidth, alignment: Alignment.topCenter,
      )),
      Positioned(left: 5, bottom: 5, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text("小甜甜", style: TextStyle(fontSize: 20, color: Colors.white)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Text("23岁", style: TextStyle(fontSize: 15, color: Colors.white)),
          SysWidgetCreator.createCommonVerticalDevider(height: 15),
          Text("射手座", style: TextStyle(fontSize: 15, color: Colors.white)),
          SysWidgetCreator.createCommonVerticalDevider(height: 15),
          Text("166cm", style: TextStyle(fontSize: 15, color: Colors.white)),
        ]),
        Text("接单量5", style: TextStyle(fontSize: 15, color: Colors.white)),
        Text("10币/半小时", style: TextStyle(fontSize: 17, color: Colors.white),),
      ],),),
    ],);
  }
}
