import 'package:flutter/widgets.dart';
import 'package:zpub_bas/zpub_bas.dart';

import 'LoginPlugin.dart';

/*
 * 类描述：登录提供的Service
 * 作者：郑朝军 on 2019/6/6
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/6
 * 修改备注：
 */
class LoginPluginService extends InterfaceBaseImpl
{
  @override
  Future<T> runPlugin<T extends Object>(State<StatefulWidget> state,
      {dynamic initPara})
  {
    StateManager.getInstance().startWidegtStateAndRemove(new LoginPlugin(), state);
  }

  @override
  Widget runWidget({dynamic initPara})
  {
    return new LoginPlugin();
  }
}
