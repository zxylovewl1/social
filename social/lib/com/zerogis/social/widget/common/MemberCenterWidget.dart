import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/constant/PluginInitParamKeyConstant.dart';
import 'package:social/com/zerogis/social/manager/ExitManager.dart';
import 'package:social/com/zerogis/social/plugin/common/LoginPlugin.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:social/com/zerogis/social/widget/core/CommonWidgetCreator.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/UserMethod.dart';
import 'package:zpub_plugin/com/zerogis/zpubPlugin/widget/WidgetStatefulBase.dart';

/*
 * 个人中心组件 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class MemberCenterWidget extends WidgetStatefulBase
{
  MemberCenterWidget({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new MemberCenterWidgetState();
  }

  static String toStrings()
  {
    return "MemberCenterWidget";
  }
}

/*
 * 组件功能 <br/>
 */
class MemberCenterWidgetState extends WidgetBaseState<MemberCenterWidget>
{
  List<dynamic> _mList;

  String mImgUrl;

  MemberCenterWidgetState()
  {}

  void initState()
  {
    super.initState();
    _mList = mInitParaMap[MapKeyConstant.MAP_KEY_LIST];
    if (UserMethod.getUser().getGender() == 0)
    {
      mImgUrl = "assets/images/icon-gheadportrait.png";
    }
    else
    {
      mImgUrl = "assets/images/icon-headportrait.png";
    }
  }

  Widget build(BuildContext context)
  {
    return createCommonRefresh(new ListView(
      children: <Widget>[
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
                              mImgUrl)), onTap: ()
                      {

                      },),
                      new Text(UserMethod.getUser().getName(), style: TextStyleRes.text_color_text4_larger,),
                    ],)
                )
              ],
            )),
        new Card(
            margin: const EdgeInsets.only(left: 19, right: 19, top: 20),
            child: new WeCells(
                children: createCellWidget())),
        new Padding(padding: EdgeInsets.only(left: 19, right: 19, top: 15), child: new WeButton(
          '退出登录',
          theme: WeButtonType.warn,
          onClick: ()
          {
            WeDialog.confirm(context)(
                '确定退出当前登录用户?',
                title: '注销登录',
                onConfirm: ()
                {
                  doClickLogout();
                }
            );
          },
        ),),
      ],
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
        if (_mList.last == map)
        {
          WeDialog.confirm(context)(
              '确定清空缓存?',
              title: '清空缓存',
              onConfirm: ()
              {
                showToast("清除成功");
              }
          );
        }
        else
        {
          runPluginName(map[MapKeyConstant.MAP_KEY_PLUGIN]);
        }
      }));
    });
    return list;
  }

  void doClickLogout()
  {
    StateManager.getInstance().startWidegtStateAndRemove(new LoginPlugin(), StateManager.getInstance().currentState());
    ExitManager.clearLocalData();
  }

  @override
  Future<void> onRefresh()
  {
    return super.onRefresh();
  }
}


