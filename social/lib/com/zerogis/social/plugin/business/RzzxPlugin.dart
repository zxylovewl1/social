import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/widget/core/CommonWidgetCreator.dart';
import 'package:zpub_plugin/zpub_plugin.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';

void main()
{
  runApp(new RzzxPlugin());
}

/*
 * 认证中心页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class RzzxPlugin extends PluginStatefulBase
{
  RzzxPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new RzzxPluginState();
  }

  static String toStrings()
  {
    return "RzzxPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class RzzxPluginState extends PluginBaseState<RzzxPlugin>
{
  List<dynamic> _mList;

  void initState()
  {
    super.initState();
    _mList = mInitParaMap[MapKeyConstant.MAP_KEY_LIST];
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
      context, Card(
        child: WeCells(
            children: createCellWidget())),
    );
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
