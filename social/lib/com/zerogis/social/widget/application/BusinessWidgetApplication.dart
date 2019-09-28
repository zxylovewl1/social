import 'package:social/com/zerogis/social/widget/common/HomeWidget1.dart';
import 'package:social/com/zerogis/social/widget/common/HomeWidget1Service.dart';
import 'package:social/com/zerogis/social/widget/common/HomeWidget2.dart';
import 'package:social/com/zerogis/social/widget/common/HomeWidget2Service.dart';
import 'package:social/com/zerogis/social/widget/common/HomeWidget3.dart';
import 'package:social/com/zerogis/social/widget/common/HomeWidget3Service.dart';
import 'package:social/com/zerogis/social/widget/common/HomeWidget4.dart';
import 'package:social/com/zerogis/social/widget/common/HomeWidget4Service.dart';
import 'package:social/com/zerogis/social/widget/common/MemberCenterWidget.dart';
import 'package:social/com/zerogis/social/widget/common/MemberCenterWidgetService.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/Plugin.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';

/*
 * 类描述：其他模块的注册中心暂时写到此处，将来按照模块的方式依赖的时候再分开：
 * 插件中需要更换对应到组件需要把组件进行注册，如果对应功能到组件一定不会更换可以不用注册
 * 作者：郑朝军 on 2019/6/6
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/6
 * 修改备注：
 */
class BusinessWidgetApplication
{
  void onCreate()
  {
    List<Plugin> plugin = InitSvrMethod.getInitSvrPlugins();
    plugin.forEach((plugin)
    {
      if (plugin.classurl == HomeWidget1.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 主界面组件1
        WidgetsFactory.getInstance().add(plugin.name, new HomeWidget1Service());
      }
      else if (plugin.classurl == HomeWidget2.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 主界面组件2
        WidgetsFactory.getInstance().add(plugin.name, new HomeWidget2Service());
      }
      else if (plugin.classurl == HomeWidget3.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 主界面组件3
        WidgetsFactory.getInstance().add(plugin.name, new HomeWidget3Service());
      }
      else if (plugin.classurl == HomeWidget4.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 主界面组件4
        WidgetsFactory.getInstance().add(plugin.name, new HomeWidget4Service());
      }
      else if (plugin.classurl == MemberCenterWidget.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_2)
      { // 个人中心
        WidgetsFactory.getInstance().add(plugin.name, new MemberCenterWidgetService());
      }
    });
  }
}
