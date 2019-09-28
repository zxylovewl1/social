import 'package:flutter/widgets.dart';
import 'package:zpub_bas/zpub_bas.dart';

import 'MemberForgetPwdPlugin.dart';

/*
 * 类描述：**模块提供的Service其他模块调用本模块对外提供的相关方法
 * 作者：郑朝军 on 2019/6/6
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/6
 * 修改备注：
 */
class MemberForgetPwdPluginService extends InterfaceBaseImpl
{
  @override
  Future<T> runPlugin<T extends Object>(State<StatefulWidget> state,
      {dynamic initPara})
  {
    return StateManager.getInstance().startWidegtState(new MemberForgetPwdPlugin(), state);
  }

  @override
  Widget runWidget({dynamic initPara})
  {
    return new MemberForgetPwdPlugin();
  }
}
