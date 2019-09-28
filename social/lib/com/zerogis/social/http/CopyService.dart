import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/MessageConstant.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/WhatConstant.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/service/BaseService.dart';
import 'package:zpub_http/zpub_http.dart';
import 'package:zpub_svr/com/zerogis/zpubsvr/constant/HttpParamKeyValue.dart';

/*
 * 功能：***模块
 * 需要传入的键：
 * 传入的值类型：
 * 传入的值含义：
 * 是否必传 ：
 * 作者：郑朝军 on 2019/4/7 23:23
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 */
class CopyService extends BaseService
{
  /*
   * 查询****<br/>
   */
  static void queryParcel(final HttpListener listener)
  {
    BaseService.showProgressBar(listener, text: "正在查询***");
    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_AreaSvr)
        .addParam(HttpParamKeyValue.PARAM_KEY_CMD, HttpParamKeyValue.PARAM_VALUE_LOGIN)
        .addParam(HttpParamKeyValue.PARAM_KEY_MAJOR, "主类型")
        .addParam(HttpParamKeyValue.PARAM_KEY_MINOR, "子类型")
        .addParam("sys", "11")
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response);
      if (BaseService.isDataInvalid("queryParcel", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }
      // 业务代码

      return MessageConstant.MSG_LOGIN_SUCCESS;
    }).then((data)
    {
      BaseService.sendMessage("queryParcel", data, WhatConstant.WHAT_NET_DATA_SUCCESS, listener);
    }).catchError((e)
    {
      BaseService.sendMessage("queryParcel", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }
}
