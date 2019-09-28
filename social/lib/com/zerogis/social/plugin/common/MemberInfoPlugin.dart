import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/http/MemberService.dart';
import 'package:weui/weui.dart';
import 'package:zpub_att/zpub_att.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/Fld.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/FldValue.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/constant/SysMajMinConstant.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/UserMethod.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/MessageConstant.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new MemberInfoPlugin());
}

/*
 * 个人信息页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class MemberInfoPlugin extends PluginStatefulBase
{
  MemberInfoPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new MemberInfoPluginState();
  }

  static String toStrings()
  {
    return "MemberInfoPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class MemberInfoPluginState extends PluginBaseState<MemberInfoPlugin>
{
  Widget mAttWidget;

  void initState()
  {
    super.initState();
    mAttWidget = createKeyAttWidget();
  }

  Widget build(BuildContext context)
  {
    return buildBody(
        context, new ListView(children: <Widget>[
      new Card(
          child: new ListView(physics: new NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                mAttWidget
              ])),

      new Padding(padding: EdgeInsets.only(top: 10, right: 3, left: 3, bottom: 10), child: new WeButton(
        '确定',
        theme: WeButtonType.warn,
        onClick: ()
        {
          doClickUpdata();
        },
      ),),
    ],)
    );
  }

  /*
   * 创建孩子网络模板组件
   */
  Widget createKeyAttWidget()
  {
    mChildrenItem.clear();
    GlobalKey key = new GlobalKey<State<StatefulWidget>>();
    mChildrenItem[key] = new AttWidget(
        SysMajMinConstant.MAJOR_SYS,
        SysMajMinConstant.MINOR_SYS_USER1,
        mId: int.parse(UserMethod.getUserId()),
        key: key);
    return mChildrenItem.values
        .toList()
        .first;
  }

  @override
  void onNetWorkSucceed(String method, Object values)
  {
    super.onNetWorkSucceed(method, values);
    if (method == "updateMemberInfo")
    {
      finish();
    }
  }

  void doClickUpdata()
  {
    Map<String, String> map = queryAttKeyValue();
    if (CxTextUtil.isEmptyMap(map))
    {
      return;
    }
    MemberService.updateMemberInfo(map, this);
  }

  /*
   * 获取属性的值
   */
  Map<String, String> queryAttKeyValue()
  {
    // 需要重模版属性中获取数据所以需要依赖
    Map<String, String> map = {};
    mChildrenItem.forEach((key, widgetChild)
    {
      if (widgetChild is AttWidget &&
          key.currentState is AttWidgetState)
      {
        AttWidgetState state = key.currentState;
        List<Map> list = state.queryAttKeyValue();

        Iterator<Map> iterator = list.iterator;
        while (iterator.moveNext())
        {
          Map result = iterator.current;
          Fld fld = result[MapKeyConstant.MAP_KEY_FLD];
          dynamic value = result[MapKeyConstant.MAP_KEY_VALUE];
          String colname = fld.getColname();
          if (fld.getNullable() == DigitValueConstant.APP_DIGIT_VALUE_0 && CxTextUtil.isEmptyObject(value))
          {
            map.clear();
            showToast(fld.getNamec() + MessageConstant.MSG_PARAM_NOT_NULL);
            break;
          }
          if (value is FldValue)
          {
            map[colname] = value.getDbvalue();
          }
          else
          {
            map[colname] = value;
          }
        }
      }
    });
    return map;
  }
}
