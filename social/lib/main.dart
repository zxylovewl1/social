import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zpub_bas/zpub_bas.dart';

import 'com/zerogis/social/application/SoftwareApplication.dart';
import 'com/zerogis/social/plugin/InstancePlugin.dart';

void main()
{
  SoftwareApplication.getInstance().onCreate();
  runApp(new RouterWidget());
}

/*
 * 功能：路由壳子
 * 需要传入的键：
 * 传入的值类型：
 * 传入的值含义：
 * 是否必传 ：
 * 作者：郑朝军 on 2019/4/7 23:23
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 */
class RouterWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      home: new InstancePlugin(),
      debugShowCheckedModeBanner: Log.isDebug,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterI18nDelegate(
            useCountryCode: true,
            fallbackFile: 'en',
            path: 'assets/locale'
        ),
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: Locale("zh"),
    );
  }
}
