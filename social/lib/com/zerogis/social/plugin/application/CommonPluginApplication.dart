import 'package:social/com/zerogis/social/plugin/business/CopyPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/CopyPluginService.dart';
import 'package:social/com/zerogis/social/plugin/business/FuncPlugin.dart';
import 'package:social/com/zerogis/social/plugin/business/FuncPluginService.dart';
import 'package:social/com/zerogis/social/plugin/common/LoginPlugin.dart';
import 'package:social/com/zerogis/social/plugin/common/LoginPluginService.dart';
import 'package:social/com/zerogis/social/plugin/common/MainPlugin.dart';
import 'package:social/com/zerogis/social/plugin/common/MainPluginService.dart';
import 'package:social/com/zerogis/social/plugin/common/MemberInfoPlugin.dart';
import 'package:social/com/zerogis/social/plugin/common/MemberInfoPluginService.dart';
import 'package:social/com/zerogis/social/plugin/common/MemberResetPwdPlugin.dart';
import 'package:social/com/zerogis/social/plugin/common/MemberResetPwdPluginService.dart';
import 'package:social/com/zerogis/social/plugin/common/PhotoBrowsePlugin.dart';
import 'package:social/com/zerogis/social/plugin/common/PhotoBrowsePluginService.dart';
import 'package:social/com/zerogis/social/plugin/common/WebViewPlugin.dart';
import 'package:social/com/zerogis/social/plugin/common/WebViewPluginService.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/bean/Plugin.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/method/InitSvrMethod.dart';

/*
 * 类描述：公共程序启动注册模块：可以理解成Android中的AndroidManifest.xml
 * 作者：郑朝军 on 2019/6/1
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/1
 * 修改备注：
 */
class CommonPluginApplication
{
  void onCreate()
  {
    List<Plugin> plugin = InitSvrMethod.getInitSvrPlugins();
    plugin.forEach((plugin)
    {
      if (plugin.classurl == LoginPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 登录插件
        PluginsFactory.getInstance().add(plugin.name, new LoginPluginService());
      }
      else if (plugin.classurl == MainPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 主界面插件
        PluginsFactory.getInstance().add(plugin.name, new MainPluginService());
      }
      else if (plugin.classurl == PhotoBrowsePlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 相册浏览插件
        PluginsFactory.getInstance().add(plugin.name, new PhotoBrowsePluginService());
      }
      else if (plugin.classurl == WebViewPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 网页浏览插件
        PluginsFactory.getInstance().add(plugin.name, new WebViewPluginService());
      }
      else if (plugin.classurl == CopyPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 模版插件
        PluginsFactory.getInstance().add(plugin.name, new CopyPluginService());
      }
      else if (plugin.classurl == MemberInfoPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 个人信息页
        PluginsFactory.getInstance().add(plugin.name, new MemberInfoPluginService());
      }
      else if (plugin.classurl == MemberResetPwdPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 重置密码页
        PluginsFactory.getInstance().add(plugin.name, new MemberResetPwdPluginService());
      }


      else if (plugin.classurl == FuncPlugin.toStrings() &&
          plugin.getType() == DigitValueConstant.APP_DIGIT_VALUE_1)
      { // 功能菜单页
        PluginsFactory.getInstance().add(plugin.name, new FuncPluginService());
      }
    });
  }
}
