import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/http/InitService.dart';
import 'package:social/com/zerogis/social/http/MemberService.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_third_shard/zpub_third_shard.dart';

import 'MemberForgetPwdPlugin.dart';

/*
 * 功能：登录页
 * 需要传入的键：
 * 传入的值类型：
 * 传入的值含义：
 * 是否必传 ：
 * 作者：郑朝军 on 2019/4/7 23:23
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 */
class LoginPlugin extends FuctionStateFulBase
{
  State<StatefulWidget> createState()
  {
    return new LoginPluginState();
  }

  static String toStrings()
  {
    return "LoginPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class LoginPluginState extends FuctionStateBase<LoginPlugin>
{
  /*
   * 用户名输入框
   */
  TextEditingController mControllerUser = new TextEditingController();

  /*
   * 密码输入框
   */
  TextEditingController mControllerPassword = new TextEditingController();

  List<dynamic> mUser;

  LoginPluginState() : super()
  {
    mTitle = '登录';
    hideBackButton();
    mControllerUser.text = SPUtil.get(MapKeyConstant.MAP_KEY_NAME, "");
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              decoration: new BoxDecoration(
                border:
                Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.grey,
                    ),
                  ),
                  new Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  new Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '请输入您的账号',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: mControllerUser,
                      ))
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              decoration: new BoxDecoration(
                border:
                Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: Icon(
                      Icons.lock_open,
                      color: Colors.grey,
                    ),
                  ),
                  new Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.5),
                    margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                  ),
                  new Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '请输入您的密码',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: mControllerPassword,
                        obscureText: true,
                      ))
                ],
              ),
            ),
            new Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              height: 40,
              child: new RaisedButton(
                onPressed: ()
                {
                  doClickLoginButton();
                },
                child: new Text('登录'),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(28.0)),
                splashColor: Colors.white,
                color: Colors.blue,
              ),
            ),
            new GestureDetector(child: new Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: new Align(
                  child: new Text('忘记密码？'),
                  alignment: Alignment.centerRight,
                )), onTap: ()
            {
              StateManager.getInstance().startWidegtState(new MemberForgetPwdPlugin(), this);
            },)
          ],
        ));
    return widget;
  }

  void doClickLoginButton()
  {
    MemberService.loginByEmail("123", "123", this);
  }

  void doClickLoginButtonOld()
  {
    String user = mControllerUser.text;
    String password = mControllerPassword.text;
    if (CxTextUtil.isEmpty(user))
    {
      showToast("请输入用户名");
      return;
    }
    if (CxTextUtil.isEmpty(password))
    {
      showToast("请输入密码");
      return;
    }
    if (password.length < 4)
    {
      showToast("密码不得小于6位");
      return;
    }
    MemberService.loginByEmail(user, password, this);
  }

  void onNetWorkSucceed(String method, Object values)
  {
    if (method == "loginByEmail")
    {
      MemberService.queryInitSvr(this);
    }
    else if (method == "queryInitSvr")
    {
      InitService.queryInitSvrPlugin(this);
    }
    else if (method == "queryInitSvrPlugin")
    {
      PluginsFactory.getInstance().get("main").runPlugin(this);
    }
  }


  void onNetWorkFaild(String method, Object values)
  {
    if (method == "loginByEmail")
    {
      InitService.queryInitSvrPlugin(this);
    }
    else
    {
      super.onNetWorkFaild(method, values);
    }
  }
}
