import 'package:social/com/zerogis/social/method/SlotMethod.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/MessageConstant.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/WhatConstant.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/InitSvr.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/Plugin.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';
import 'package:zpub_sqflite/zpub_sqflite.dart';
import 'package:zpub_http/zpub_http.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/service/BaseService.dart';

/*
 * 功能：初始化模块
 * 需要传入的键：
 * 传入的值类型：
 * 传入的值含义：
 * 是否必传 ：
 * 作者：郑朝军 on 2019/4/7 23:23
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 */
class InitService extends BaseService
{
  /*
   * 系统初始化<br/>
   */
  static void queryInitSvr(final String tag, final int page,
      final HttpListener listener)
  {
    BaseService.showProgressBar(listener, text: "正在初始化");
    HttpProtocol protocol = new HttpProtocol();
    protocol.setService("InitSvr").post().then((response)
    {
      return MessageConstant.MSG_EMPTY;
    }).then((data)
    {
      BaseService.sendMessage(
          "queryParcel", data, WhatConstant.WHAT_NET_DATA_SUCCESS, listener);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "queryParcel", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }

  /*
   * 系统初始化插件对象(将来需要删除)<br/>
   */
  static void queryInitSvrPlugin(HttpListener listener)
  {
    SQLiteDBMethod.getInstance()
        .queryForAll(new Plugin().runtimeType.toString())
        .then((result)
    {
      List<Plugin> list = <Plugin>[];
      result.forEach((plugin)
      {
        list.add(Plugin.fromJson(plugin));
      });
      InitSvr initSvr = new InitSvr();

      initSvr.setPlugin(list);
      InitSvrMethod.setInitSvr(initSvr);
      SlotMethod.slotAll();
      return MessageConstant.MSG_SUCCESS;
    }).then((data)
    {
      BaseService.sendMessage("queryInitSvrPlugin", data,
          WhatConstant.WHAT_NET_DATA_SUCCESS, listener);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "queryInitSvrPlugin", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }
}
