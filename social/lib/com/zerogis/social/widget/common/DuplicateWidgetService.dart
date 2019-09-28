import 'package:flutter/widgets.dart';
import 'package:zpub_bas/zpub_bas.dart';

import 'DuplicateWidget.dart';

/*
 * 类描述：附件组件提供的Service
 * 作者：郑朝军 on 2019/6/6
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/6
 * 修改备注：
 */
class DuplicateWidgetService extends InterfaceBaseImpl
{
  @override
  Widget runWidget({dynamic initPara})
  {
    return new DuplicateWidget();
  }

  @override
  Widget runWidgetParam({List<String> list, bool isEdit = true, valueChangedMethod})
  {
    return new DuplicateWidget(mMediaList: list, mIsEdit: isEdit);
  }
}
