import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/http/MemberService.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/constant/FldConstant.dart';

void main()
{
  runApp(new MemberForgetPwdPlugin());
}

/*
 * 忘记密码,重设密码页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class MemberForgetPwdPlugin extends FuctionStateFulBase
{
  MemberForgetPwdPlugin({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new MemberForgetPwdPluginState();
  }

  static String toStrings()
  {
    return "MemberForgetPwdPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class MemberForgetPwdPluginState extends FuctionStateBase<MemberForgetPwdPlugin>
{
  /*
   * 用户名输入框,密码输入框
   */
  String _mUser, _mEmail, _mCode;

  /*
   * 是否显示新密码
   */
  bool _mShowNewPwd = false;

  /*
   * 密码输入框
   */
  TextEditingController mControllerPassword = new TextEditingController();


  MemberForgetPwdPluginState()
  {
    mTitle = '找回密码';
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context, WeForm(
        children: <Widget>[
          WeInput(
            label: '账号:',
            hintText: '请输入您的账号',
            clearable: true,
            onChange: (value)
            {
              _mUser = value;
            },
          ),
          WeInput(
            label: '邮箱:',
            hintText: '请输入您的邮箱',
            clearable: true,
            onChange: (value)
            {
              _mEmail = value;
            },
          ),
          WeInput(
            label: '验证码:',
            hintText: '请输入验证码',
            type: TextInputType.number,
            footer: WeButton(
              '获取验证码', size: WeButtonSize.mini,
              theme: WeButtonType.primary,
              onClick: ()
              {
                doClickSendCode();
              },),
            onChange: (value)
            {
              _mCode = value;
            },
          ),
          new Offstage(
            child: WeCell(
                label: "新密码:",
                minHeight: 48,
                content: DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(border: InputBorder.none,),
                    controller: mControllerPassword,),
                )
            ),
            offstage: !_mShowNewPwd,
          ),
          new Offstage(
            child: new Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: WeButton(
                  '完成', hollow: true, theme: WeButtonType.primary, onClick: ()
              {
                doClickFinishBtn();
              }),
            ),
            offstage: _mShowNewPwd,
          ),
        ]
    ));

    return widget;
  }

  /*
   * 发送验证码
   */
  void doClickSendCode()
  {
    if (CxTextUtil.isEmpty(_mUser))
    {
      showToast("账号不能为空");
      return;
    }
    if (CxTextUtil.isEmpty(_mEmail))
    {
      showToast("邮箱不能为空");
      return;
    }

    MemberService.updateSendCode(_mUser, _mEmail, this);
  }

  void doClickFinishBtn()
  {
    if (CxTextUtil.isEmpty(_mUser))
    {
      showToast("账号不能为空");
      return;
    }
    if (CxTextUtil.isEmpty(_mCode))
    {
      showToast("验证码不能为空");
      return;
    }
    MemberService.queryVerifyCode(_mUser, _mCode, this);
  }

  @override
  void onNetWorkSucceed(String method, Object values)
  {
    if (method == "queryVerifyCode")
    {
      setState(()
      {
        if (values is Map)
        {
          mControllerPassword.text = values[FldConstant.FLD_PWD];
          _mShowNewPwd = true;
        }
      });
    }
    else
    {
      super.onNetWorkSucceed(method, values);
    }
  }

  void onNetWorkFaild(String method, Object values)
  {
    if (method == "updateSendCode")
    {
      showToast("邮箱错误!");
    }
    else
    {
      super.onNetWorkSucceed(method, values);
    }
  }
}
