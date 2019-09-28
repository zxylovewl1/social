import 'package:social/com/zerogis/social/plugin/application/BusinessPluginApplication.dart';
import 'package:social/com/zerogis/social/plugin/application/CommonPluginApplication.dart';
import 'package:social/com/zerogis/social/widget/application/BusinessWidgetApplication.dart';
import 'package:social/com/zerogis/social/widget/application/CommonWidgetApplication.dart';

/*
 * 类描述：装载，载入插件，组件，方法封装
 * 作者：郑朝军 on 2019/6/10
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/10
 * 修改备注：
 */
class SlotMethod
{
  /*
   * 装载插件，组件到内存中
   */
  static void slotAll()
  {
    slotPlugins();
    slotWidgets();
  }

  /*
   * 装载插件，组件：按照模块进行注册插件：将所有模块进行注册到内存中
   */
  static void slotPlugins()
  {
    // 公共插件模块注册中心
    CommonPluginApplication commonApplication = new CommonPluginApplication();
    commonApplication.onCreate();
    // 考勤插件模块注册中心
    // 其他业务模块注册中心
    BusinessPluginApplication businessApplication = new BusinessPluginApplication();
    businessApplication.onCreate();
  }

  /*
   * 装载插件，组件：按照模块进行注册插件：将所有模块进行注册到内存中
   */
  static void slotWidgets()
  {
    // 公共组件模块注册中心
    CommonWidgetApplication commonApplication = new CommonWidgetApplication();
    commonApplication.onCreate();
    // 其他组件业务模块注册中心
    BusinessWidgetApplication businessApplication = new BusinessWidgetApplication();
    businessApplication.onCreate();
  }
}
