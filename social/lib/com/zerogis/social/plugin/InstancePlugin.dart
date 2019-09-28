import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social/com/zerogis/social/constant/SysCfgKeyConstant.dart';
import 'package:social/com/zerogis/social/http/MemberService.dart';
import 'package:social/com/zerogis/social/manager/VersionUpdateManager.dart';
import 'package:social/com/zerogis/social/method/SlotMethod.dart';
import 'package:social/com/zerogis/social/resource/StringRes.dart';
import 'package:social/com/zerogis/social/util/ScreenUtil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/InitSvr.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/User.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/manager/SysCfgManager.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/UserMethod.dart';
import 'package:zpub_third/zpub_third.dart';
import 'package:zpub_third_shard/zpub_third_shard.dart';

import 'common/LoginPlugin.dart';


/*
 * 初始化页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class InstancePlugin extends FuctionStateFulBase
{
  State<StatefulWidget> createState()
  {
    return new InstancePluginState();
  }
}

/*
 * 页面功能 <br/>
 */
class InstancePluginState extends FuctionStateBase<InstancePlugin>
{
  /*
   * 系统版本号
   */
  String mSVersion = "";

  /*
   * 不使用入栈操作
   */
  bool usePushStack()
  {
    return false;
  }

  InstancePluginState()
  {
    resetProgressBar(text: "正在初始化...");
    hideTitleBar();
    setContentBackground(Colors.blue);
  }

  void initState()
  {
    super.initState();
    initData();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        new Stack(
          children: <Widget>[
            new Container(
              width: ScreenUtil.getInstance().getScreenWidth(),
              height: ScreenUtil.getInstance().getScreenHeight(),
              child: new Image.asset(
                "assets/images/bg_guide.jpg",
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              alignment: Alignment.bottomCenter,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(StringRes.company),
                  new Text(mSVersion),
                ],
              ),
            )
          ],
        ));
    return widget;
  }

  @override
  void onNetWorkSucceed(String method, Object values)
  {
    if (method == "getUserInfo")
    {
      SlotMethod.slotAll();
      initSvr();
    }
  }

  /*
   * 初始化数据
   */
  void initData()
  {
    initVersionName();
    initForceLogin();
    PermissionUtil.initPermission([
      PermissionGroup.location,
      PermissionGroup.storage,
    ]);
  }

  /*
   * 初始化版本号
   */
  void initVersionName()
  {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo)
    {
      setState(()
      {
        mSVersion = packageInfo.version;
      });
    });
  }

  /*
   * 初始化强制登录
   */
  void initForceLogin()
  {
    SPUtil.init().then((sharedPreferences)
    {
      User user = UserMethod.getUser();
      if (user != null)
      {
        MemberService.getUserInfo(user.getId(), this);
      }
      else
      {
        StateManager.getInstance().startWidegtStateAndRemove(new LoginPlugin(), this);
      }
    });
  }

  /*
   * 初始化缓存数据相关,如果缓存数据没有则从服务器中拉取
   */
  void initSvr()
  {
    InitSvr initSvr = InitSvrMethod.getInitSvr();
    if (initSvr != null)
    {
      initUpdateInfo();
    }
  }

  /*
   * 检查版本更新，如果版本不更新则跳转到主页面
   */
  void initUpdateInfo()
  {
    SysCfgManager sysCfgManager = SysCfgManager.getInstance();
    String version =
    sysCfgManager.querySysCfgValue(SysCfgKeyConstant.SYSCFG_KEY_VERSION);
    if (!CxTextUtil.isEmpty(version) &&
        VersionUpdateManager.updateApp(mSVersion, version))
    {
      String appUrl = sysCfgManager
          .querySysCfgValue(SysCfgKeyConstant.SYSCFG_KEY_VERSION_URL);
      if (!CxTextUtil.isEmpty(version))
      {
        if (Platform.isAndroid)
        {
          VersionUpdateManager.showDownloadDialog(this, version, (result)
          {
            if (result)
            {
              startToHomePage();
            }
            else
            {
              updateDownloadApp(appUrl);
            }
          });
        }
        else
        {
          showToast("ios版本需从AppStore下载");
        }
      }
      else
      {
        showToast("未配置apk下载地址");
      }
    }
    else
    {
      startToHomePage();
    }
  }

  /*
   * 更新下载app
   * @param AppUrl app下载路径
   */
  void updateDownloadApp(String appUrl)
  async
  {
    if (await canLaunch(appUrl))
    {
      await launch(appUrl);
    }
    else
    {
      showToast(appUrl);
    }
  }

  /*
   * 跳转到主页面
   */
  void startToHomePage()
  {
    PluginsFactory.getInstance().get("main").runPlugin(this);
  }
}
