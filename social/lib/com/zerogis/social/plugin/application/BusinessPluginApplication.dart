import 'package:social/com/zerogis/social/plugin/business/CZPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/CZPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/GZPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/GZPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/JYPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/JYPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/MyFBPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/MyFBPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/PublishPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/PublishPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/QBPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/QBPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/RzzxPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/RzzxPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/SPLTPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/SPLTPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/XCXPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/XCXPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/YYXQPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/YYXQPluginService.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/Plugin.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';

/*
 * 类描述：其他模块的注册中心暂时写到此处，将来按照模块的方式依赖的时候再分开
 * 作者：郑朝军 on 2019/6/6
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/6
 * 修改备注：
 */
class BusinessPluginApplication
{
  void onCreate()
  {
    List<Plugin> plugin = InitSvrMethod.getInitSvrPlugins();
    plugin.forEach((plugin)
    {
      if (plugin.classurl == JYPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 交友页
        PluginsFactory.getInstance().add(plugin.name, new JYPluginService());
      }
      else if (plugin.classurl == RzzxPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 认证中心
        PluginsFactory.getInstance().add(plugin.name, new RzzxPluginService());
      }
      else if (plugin.classurl == PublishPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 发布页面
        PluginsFactory.getInstance().add(plugin.name, new PublishPluginService());
      }
      else if (plugin.classurl == XCXPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 小程序页面
        PluginsFactory.getInstance().add(plugin.name, new XCXPluginService());
      }
      else if (plugin.classurl == YYXQPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 邀约详情页面
        PluginsFactory.getInstance().add(plugin.name, new YYXQPluginService());
      }
      else if (plugin.classurl == GZPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 我的关注页面
        PluginsFactory.getInstance().add(plugin.name, new GZPluginService());
      }
      else if (plugin.classurl == SPLTPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 视频聊天页面
        PluginsFactory.getInstance().add(plugin.name, new SPLTPluginService());
      }
      else if (plugin.classurl == CZPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 充值页面
        PluginsFactory.getInstance().add(plugin.name, new CZPluginService());
      }
      else if (plugin.classurl == QBPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 钱包页面
        PluginsFactory.getInstance().add(plugin.name, new QBPluginService());
      }
      else if (plugin.classurl == MyFBPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 我的发布页面
        PluginsFactory.getInstance().add(plugin.name, new MyFBPluginService());
      }
    });
  }
}
