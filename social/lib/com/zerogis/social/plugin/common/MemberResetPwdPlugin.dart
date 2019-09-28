import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/http/MemberService.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_http/com/zerogis/zpubhttp/constant/MessageConstant.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new MemberResetPwdPlugin());
}

/*
 * 重设密码页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class MemberResetPwdPlugin extends PluginStatefulBase
{
  MemberResetPwdPlugin({Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new MemberResetPwdPluginState();
  }

  static String toStrings()
  {
    return "MemberResetPwdPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class MemberResetPwdPluginState extends PluginBaseState<MemberResetPwdPlugin>
{
  /*
   * 密码输入框
   */
  String _mOldPwd, _mNewPwd, _mRepatPwd;

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context, WeForm(
        children: <Widget>[
          WeInput(
            label: '旧密码:',
            hintText: '旧密码',
            clearable: true,
            onChange: (value)
            {
              _mOldPwd = value;
            },
          ),
          WeInput(
            label: '新密码:',
            hintText: '新密码',
            clearable: true,
            onChange: (value)
            {
              _mNewPwd = value;
            },
          ),
          WeInput(
            label: '重复密码:',
            hintText: '重复密码',
            clearable: true,
            onChange: (value)
            {
              _mRepatPwd = value;
            },
          ),
          new Padding(padding: EdgeInsets.only(top: 10, right: 5, left: 5), child: new WeButton(
            '确定',
            theme: WeButtonType.warn,
            onClick: ()
            {
              doClickFinishBtn();
            },
          ),),
        ]
    ));

    return widget;
  }

  void doClickFinishBtn()
  {
    if (CxTextUtil.isEmpty(_mOldPwd))
    {
      showToast("旧密码不能为空");
      return;
    }
    if (CxTextUtil.isEmpty(_mNewPwd) || CxTextUtil.isEmpty(_mRepatPwd))
    {
      showToast("新密码不能为空");
      return;
    }
    if (_mNewPwd != _mRepatPwd)
    {
      showToast("新密码不一致");
      return;
    }
    MemberService.setPsw(_mOldPwd, _mRepatPwd, this);
  }

  @override
  void onNetWorkSucceed(String method, Object values)
  {
    if (method == "setPsw")
    {
      finish();
    }
    else
    {
      super.onNetWorkSucceed(method, values);
    }
  }

  void onNetWorkFaild(String method, Object values)
  {
    if (method == "setPsw")
    {
      showToast(MessageConstant.MSG_LOGIN_INVALID);
    }
    else
    {
      super.onNetWorkFaild(method, values);
    }
  }
}
