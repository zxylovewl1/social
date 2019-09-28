import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:social/com/zerogis/social/widget/common/DuplicateWidget.dart';
import 'package:social/com/zerogis/social/widget/core/CommonWidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new PublishPlugin());
}

/*
 * 发布页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class PublishPlugin extends PluginStatefulBase
{
  PublishPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new PublishPluginState();
  }

  static String toStrings()
  {
    return "PublishPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class PublishPluginState extends PluginBaseState<PublishPlugin>
{
  List<dynamic> _mList;

  TextEditingController controller = new TextEditingController();

  void initState()
  {
    super.initState();
    _mList = mInitParaMap[MapKeyConstant.MAP_KEY_LIST];
    mWindowBackgroundColor = Colors.white;
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context, SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[

      WeCells(children: createCellWidget()),

      Padding(child: Text('补充说明：', style: TextStyleRes.text_color_text1_larger_fontw900,),
        padding: EdgeInsets.only(left: 20, top: 10),),

      Padding(child: TextField(
        controller: controller,
        maxLines: 3,
        decoration: new InputDecoration(hintText: '空泛的说明，是没有人看的...',
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
      ), padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),),

      DuplicateWidget(
        mNullable: 1,
        valueChangedMethod: (item)
        {},
        valueDeleteMethod: (position)
        {},),

    ],),));
    return widget;
  }

  /*
   * 创建cell的表格
   */
  List<Widget> createCellWidget()
  {
    List<Widget> list = <Widget>[];
    _mList.forEach((map)
    {
      list.add(CommonWidgetCreator.createLeftImgTextImg(map, size: 40, onClick: ()
      {
        runPluginName(map[MapKeyConstant.MAP_KEY_PLUGIN]);
      }));
    });
    return list;
  }
}
