import 'package:social/com/zerogis/social/widget/business/CopyWidget.dart';
import 'package:social/com/zerogis/social/widget/business/CopyWidgetService.dart';
import 'package:social/com/zerogis/social/widget/common/DuplicateWidget.dart';
import 'package:social/com/zerogis/social/widget/common/DuplicateWidgetService.dart';
import 'package:zpub_att/com/zerogis/zpubatt/widget/AttWidgetService.dart';
import 'package:zpub_att/zpub_att.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/Plugin.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';

/*
 * 类描述：公共程序启动注册模块：插件中需要更换对应到组件需要把组件进行注册，如果对应功能到组件一定不会更换可以不用注册
 * 作者：郑朝军 on 2019/6/1
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/1
 * 修改备注：
 */
class CommonWidgetApplication
{
  void onCreate()
  {
    List<Plugin> plugin = InitSvrMethod.getInitSvrPlugins();
    plugin.forEach((plugin)
    {
      if (plugin.classurl == AttWidget.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 根据主子类型生成属性组件
        WidgetsFactory.getInstance().add(plugin.name, new AttWidgetService());
      }
      else if (plugin.classurl == DuplicateWidget.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 附件组件,支持本地，网络图片显示，支持查看，编辑
        WidgetsFactory.getInstance().add(plugin.name, new DuplicateWidgetService());
      }
      else if (plugin.classurl == CopyWidget.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 模板组件
        WidgetsFactory.getInstance().add(plugin.name, new CopyWidgetService());
      }
    });
  }
}
