import 'package:social/com/zerogis/social/resource/StringRes.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/InitSvr.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/User.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/constant/FldConstant.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/constant/SysMajMinConstant.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/UserMethod.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/MessageConstant.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/WhatConstant.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/service/BaseService.dart';
import 'package:zpub_http/zpub_http.dart';
import 'package:zpub_svr/com/zerogis/zpubsvr/constant/HttpParamKeyValue.dart';

/*
 * 功能：用户模块
 * 需要传入的键：
 * 传入的值类型：
 * 传入的值含义：
 * 是否必传 ：
 * 作者：郑朝军 on 2019/4/7 23:23
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 */
class MemberService extends BaseService
{
  /*
   * 登录<br/>
   */
  static void loginByEmail(final String username, final String password,
      final HttpListener listener)
  {
    BaseService.showProgressBar(listener, text: "正在登录");
    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_LoginSvr)
        .setEncrypt(false)
        .addParam(HttpParamKeyValue.PARAM_KEY_CMD, HttpParamKeyValue.PARAM_VALUE_LOGIN)
        .addParam("username", username)
        .addParam("password", password)
        .addParam("type", "1")
        .addParam("sys", "11")
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response);
      if (BaseService.isDataInvalid("loginByEmail", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }
      User user = User.fromJson(jo);
      return user;
    }).then((data)
    {
      BaseService.sendMessage(
          "loginByEmail", data, WhatConstant.WHAT_NET_DATA_SUCCESS, listener,
          progressBar: false);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "loginByEmail", e, WhatConstant.WHAT_EXCEPITON, listener,
          progressBar: false);
    });
  }

  /*
   * 获取用户信息<br/>
   */
  static void getUserInfo(int id, HttpListener listener)
  {
    BaseService.showProgressBar(listener, text: "正在获取用户信息");
    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_AreaSvr)
        .addParam(HttpParamKeyValue.PARAM_KEY_CMD, HttpParamKeyValue.PARAM_VALUE_GetAtt)
        .addParam(HttpParamKeyValue.PARAM_KEY_MAJOR, DigitValueConstant.APP_DIGIT_VALUE_99)
        .addParam(HttpParamKeyValue.PARAM_KEY_MINOR, DigitValueConstant.APP_DIGIT_VALUE_13)
        .addParam(HttpParamKeyValue.PARAM_KEY_ID, id)
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response);
      if (BaseService.isDataInvalid("getUserInfo", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }
//      UserMethod.setUser(User.fromJson(jo));
      return "获取信息成功";
    }).then((data)
    {
      BaseService.sendMessage(
          "getUserInfo", data, WhatConstant.WHAT_NET_DATA_SUCCESS, listener);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "getUserInfo", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }

  /*
   * 系统初始化<br/>
   */
  static void queryInitSvr(final HttpListener listener,
      {bool progressBar: false})
  {
    BaseService.showProgressBar(listener, text: "正在初始化");

    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_InitSvr)
        .addParam(HttpParamKeyValue.PARAM_KEY_CMD, "get")
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response, resetToken: false);
      if (BaseService.isDataInvalid("queryInitSvr", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }
      InitSvr initSvr = InitSvr.fromJson(jo);
      InitSvrMethod.setInitSvr(initSvr);
      InitSvrMethod.setInitSvrMap(jo);

      UserMethod.setUser(initSvr.getInitSvrUser());
      return "初始化成功";
    }).then((data)
    {
      BaseService.sendMessage(
          "queryInitSvr", data, WhatConstant.WHAT_NET_DATA_SUCCESS, listener,
          progressBar: progressBar);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "queryInitSvr", e, WhatConstant.WHAT_EXCEPITON, listener,
          progressBar: progressBar);
    });
  }

  /*
   * 发送验证码到邮箱<br/>
   */
  static void updateSendCode(String no, String email,
      HttpListener listener, {String subject: StringRes.app_name, String content: StringRes
          .email_code,
        int expire: 300})
  {
    BaseService.showProgressBar(listener, text: "正在发送验证码");
    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_LoginSvr)
        .addParam(
        HttpParamKeyValue.PARAM_KEY_CMD, HttpParamKeyValue.PARAM_VALUE_SendCode)
        .addParam("no", no)
        .addParam("email", email)
        .addParam("expire", expire)
        .addParam("subject", subject)
        .addParam("content", content)
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response);
      if (BaseService.isDataInvalid("updateSendCode", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }
      return "发送验证码成功";
    }).then((data)
    {
      BaseService.sendMessage(
          "updateSendCode", data, WhatConstant.WHAT_NET_DATA_SUCCESS, listener);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "updateSendCode", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }

  /*
   * 校验邮箱验证码<br/>
   */
  static void queryVerifyCode(String no, String code, HttpListener listener)
  {
    BaseService.showProgressBar(listener, text: "正在核对验证码");
    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_LoginSvr)
        .addParam(
        HttpParamKeyValue.PARAM_KEY_CMD,
        HttpParamKeyValue.PARAM_VALUE_VerifyCode)
        .addParam("no", no)
        .addParam("code", code)
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response);
      if (BaseService.isDataInvalid("queryVerifyCode", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }
      return jo;
    }).then((data)
    {
      BaseService.sendMessage(
          "queryVerifyCode", data, WhatConstant.WHAT_NET_DATA_SUCCESS,
          listener);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "queryVerifyCode", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }

  /*
   * 修改用户信息<br/>
   */
  static void updateMemberInfo(Map<String, Object> value, HttpListener listener)
  {
    BaseService.showProgressBar(listener, text: "正在更新用户信息");
    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_AreaSvr)
        .addParam(HttpParamKeyValue.PARAM_KEY_CMD, HttpParamKeyValue.PARAM_VALUE_UpdateAtt)
        .addParam(HttpParamKeyValue.PARAM_KEY_MAJOR, SysMajMinConstant.MAJOR_SYS)
        .addParam(HttpParamKeyValue.PARAM_KEY_MINOR, SysMajMinConstant.MINOR_SYS_USER1)
        .addParam(FldConstant.FLD_ID, UserMethod.getUserId())
        .addMap(value)
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response);
      if (BaseService.isDataInvalid("updateMemberInfo", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }

      return MessageConstant.MSG_UPDATE_SUCCESS;
    }).then((data)
    {
      BaseService.sendMessage(
          "updateMemberInfo", data, WhatConstant.WHAT_NET_DATA_SUCCESS,
          listener);
    }).catchError((e)
    {
      BaseService.sendMessage(
          "updateMemberInfo", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }

  /*
   * 重置密码<br/>
   */
  static void setPsw(String oldpassword, String newpassword, HttpListener listener)
  {
    BaseService.showProgressBar(listener, text: "正在重置密码");
    HttpProtocol protocol = new HttpProtocol();
    protocol
        .setMethod(HttpParamKeyValue.PARAM_KEY_METHOD_LoginSvr)
        .addParam(HttpParamKeyValue.PARAM_KEY_CMD, HttpParamKeyValue.PARAM_VALUE_SetPsw)
        .addParam("oldpassword", oldpassword)
        .addParam("newpassword", newpassword)
        .post()
        .then((response)
    {
      Map<String, dynamic> jo = BaseService.responseData(response);
      if (BaseService.isDataInvalid("setPsw", jo, listener))
      {
        return MessageConstant.MSG_EMPTY;
      }
      return jo;
    }).then((data)
    {
      BaseService.sendMessage("setPsw", data, WhatConstant.WHAT_NET_DATA_SUCCESS, listener);
    }).catchError((e)
    {
      BaseService.sendMessage("setPsw", e, WhatConstant.WHAT_EXCEPITON, listener);
    });
  }
}
