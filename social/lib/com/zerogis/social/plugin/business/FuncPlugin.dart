import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:social/com/zerogis/social/widget/core/CommonWidgetCreator.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/core/SysWidgetCreator.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/constant/FldConstant.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/MenuMethod.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new FuncPlugin());
}

/*
 * 功能菜单页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class FuncPlugin extends PluginStatefulBase
{
  FuncPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new FuncPluginState();
  }

  static String toStrings()
  {
    return "FuncPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class FuncPluginState extends PluginBaseState<FuncPlugin>
{
  /*
   * 所有菜单集合
   */
  List<Map<dynamic, List<dynamic>>> mMenu;

  void initState()
  {
    super.initState();
    MenuMethod menu = MenuMethod.getInstance();
    mMenu = menu.queryMenu();
  }

  Widget build(BuildContext context)
  {
    Widget widget = new Container(margin: EdgeInsets.only(left: 15, right: 15), child: new ListView(
      children: createMenu(),
    ));
    return widget;
  }

  /*
   * 创建所有菜单
   */
  List<Widget> createMenu()
  {
    List<Widget> list = <Widget>[];
    mMenu.forEach((value)
    {
      value.forEach((key, menu)
      {
        list.add(new Column(children: <Widget>[
          new Align(alignment: Alignment.topLeft, child: new Padding(padding: EdgeInsets.all(10), child: new Text(
              key[FldConstant.FLD_NAMEC],
              textAlign: TextAlign.start,
              style: TextStyleRes.text_color_text1_larger_fontw900)),),
          new Card(
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: createMenuGridView(menu))
        ],));
      });
    });
    return list;
  }

  /*
   * 创建一个菜单中的所有条目
   */
  GridView createMenuGridView(List<dynamic> menu)
  {
    List<Widget> list = <Widget>[];
    menu.forEach((value)
    {
      list.add(CommonWidgetCreator.createCommonTopImgText2(value, onTap: ()
      {
//        runPluginName(value[MapKeyConstant.MAP_KEY_PLUGIN]);
      }));
    });
    return SysWidgetCreator.createMiddleGridViewWrap(list);
  }
}
