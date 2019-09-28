import 'package:flutter/widgets.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';

import 'PhotoBrowsePlugin.dart';

/*
 * 类描述：相册浏览提供的Service
 * 作者：郑朝军 on 2019/6/6
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/6
 * 修改备注：
 */
class PhotoBrowsePluginService extends InterfaceBaseImpl
{
  @override
  Future<T> runPlugin<T extends Object>(State<StatefulWidget> state,
      {dynamic initPara})
  {
    return StateManager.getInstance().startWidegtState(
        new PhotoBrowsePlugin(initPara[MapKeyConstant.MAP_KEY_LIST], initPara[MapKeyConstant.MAP_KEY_INDEX],), state);
  }

  @override
  Widget runWidget({dynamic initPara})
  {
    return null;
  }
}
