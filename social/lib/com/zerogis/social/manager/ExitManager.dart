import 'package:flutter/services.dart';
import 'package:social/com/zerogis/social/application/SoftwareApplication.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/MenuMethod.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/UserMethod.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_third_shard/zpub_third_shard.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/manager/EntityManager.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/manager/FldManager.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/manager/FldValuesManager.dart';

/*
 * 类描述：退出相关操作
 * 作者：郑朝军 on 2019/5/21
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/5/21
 * 修改备注：
 */
class ExitManager
{
  static int mCurrentBackPressedTime = 0;

  static final int BACK_PRESSED_INTERVAL = 2000;

  static Future<bool> onBackPressed(FuctionStateBase baseSceneState)
  {
    if (DateTime
        .now()
        .millisecondsSinceEpoch - mCurrentBackPressedTime >
        BACK_PRESSED_INTERVAL)
    {
      mCurrentBackPressedTime = DateTime
          .now()
          .millisecondsSinceEpoch;
      baseSceneState.showToast("再按一次退出软件");
    }
    else
    {
      exit();
    }
    return new Future.value(false);
  }

  /*
   * 退出<br/>
   * 主线程中调用<br/>
   */
  static void exit()
  {
    clearStaticData();
//    StateManager.getInstance().popAllWidget();
    SystemNavigator.pop();
  }

  /*
   * 单例设计类必须清除静态数据<br/>
   */
  static void clearStaticData()
  {}


  /*
   * 必须清除本地数据<br/>
   */
  static void clearLocalData()
  {
    UserMethod.setUser(null);
    InitSvrMethod.setInitSvr(null);
    clearSPUtil();
    MenuMethod.clear();
    FldManager.clear();
    EntityManager.clear();
    FldValuesManager.clear();
  }

  /*
   * 必须清除本地数据<br/>
   */
  static void clearSPUtil()
  {
    String username = SPUtil.get(MapKeyConstant.MAP_KEY_NAME, "");
    SPUtil.clear();
    if (!CxTextUtil.isEmpty(username))
    {
      SPUtil.put(MapKeyConstant.MAP_KEY_NAME, username);
    }
  }

  /*
    * 延迟退出<br/>
    * 主线程中调用<br/>
    */
  static void ExitDelayed()
  {}
}
