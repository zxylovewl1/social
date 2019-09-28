import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/constant/PluginInitParamKeyConstant.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/manager/ExitManager.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

/*
 * 主页(框架用例) <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class MainPlugin extends PluginStatefulBase
{
  MainPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new MainPluginState();
  }

  static String toStrings()
  {
    return "MainPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class MainPluginState extends PluginBaseState<MainPlugin>
{
  /*
   * 当前选中的TAB
   */
  int mCurrentIndex;

  /*
   * 底部导航栏Bar集合
   */
  List<BottomNavigationBarItem> mBottomNavigationBarList = <BottomNavigationBarItem>[];

  /*
   * 底部导航栏Bar文字集合
   */
  List<dynamic> mNames;

  /*
   * 底部导航栏Bar图片集合
   */
  List<IconData> mBottomIcons = <IconData>[];

  /*
   * 底部导航栏Bar选[未]中颜色集合
   */
  List<Color> bottomColor = [
    Colors.blue,
    Colors.grey,
  ];

  MainPluginState()
  {
    mTitle = '遇见';
  }

  void initState()
  {
    super.initState();
    initBottomBar();
    mCurrentIndex = mInitParaMap[PluginInitParamKeyConstant.PLUGIN_INIT_PARAM_MAIN_KEY_CURRENT_INDEX];
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        new WillPopScope(
            child: new IndexedStack(
              children: createChildrenWidget(),
              index: mCurrentIndex,
            ),
            onWillPop: ()
            {
              ExitManager.onBackPressed(this);
            }));
    return widget;
  }

  /*
   * 初始化底部导航拦
   */
  void initBottomBar()
  {
    Map<String, dynamic> map = mInitParaMap[PluginInitParamKeyConstant
        .PLUGIN_INIT_PARAM_MAIN_KEY_BOTTOM_ICON_TEXT];
    mNames = map.values.toList();
    map.keys.forEach((color)
    {
      mBottomIcons.add(new IconData(int.parse(color), fontFamily: IconFont.getFamily()));
    });
  }

  /*
   * 创建底部导航栏的函数
   */
  Widget createBottomNavigationBar()
  {
    Widget navigationBar = new CupertinoTabBar(
        currentIndex: mCurrentIndex,
        onTap: (index)
        {
          setState(()
          {
            mCurrentIndex = index;
          });
        },
        items: createBottomNavigationBarItem());
    return navigationBar;
  }

  /*
   * 创建底部导航栏的BarItem函数
   */
  List<BottomNavigationBarItem> createBottomNavigationBarItem()
  {
    mBottomNavigationBarList.clear();
    for (int i = 0; i < mNames.length; i++)
    {
      mBottomNavigationBarList.add(new BottomNavigationBarItem(
          icon: new Icon(mBottomIcons[i], color: iconColor(i), size: 20.0),
          title: new Text(
            mNames[i].toString(),
            style: getTabTextStyle(i),
          )));
    }
    return mBottomNavigationBarList;
  }

  Color iconColor(int curIndex)
  {
    if (curIndex == mCurrentIndex)
    {
      return bottomColor[0];
    }
    return bottomColor[1];
  }

  TextStyle getTabTextStyle(int curIndex)
  {
    if (curIndex == mCurrentIndex)
    {
      return TextStyleRes.text_color_text1_small;
    }
    return TextStyleRes.text_color_text1_small;
  }

  @override
  void onClick(Widget widget)
  {
//    runPluginName('FuncPlugin');
    runPluginName('PublishPlugin');
  }
}
