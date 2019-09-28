import 'package:flutter/material.dart';
import 'package:zpub_bas/zpub_bas.dart';

/*
 * 类描述：版本更新
 * 作者：郑朝军 on 2019/5/28
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/5/28
 * 修改备注：
 */
class VersionUpdateManager
{
  /*
   * 校验是否需要版本更新
   * @param localVersion 本地版本号
   * @param newVersion 服务器版本号
   * @retrun [true=需要更新]
   */
  static bool updateApp(String localVersion, String newVersion)
  {
    List<String> localVersionArray = localVersion.split("\.");
    List<String> newVersionArray = newVersion.split("\.");
    if (localVersionArray.length < newVersionArray.length)
    {
      int cha = newVersionArray.length - localVersionArray.length;
      for (int i = 0; i < cha; i++)
      {
        localVersion = localVersion + ".0";
      }
      localVersionArray = localVersion.split("\.");
    }
    for (int i = 0; i < newVersionArray.length; i++)
    {
      int temp = int.parse(newVersionArray[i]);
      int compar = int.parse(localVersionArray[i]);
      if (temp > compar)
      {
        return true;
      }
    }
    return false;
  }

  /*
   * 显示下载提示框
   */
  static void showDownloadDialog(State state, String newVersion,
      ValueChanged<bool> valueChangedMethod)
  {
    showDialog(
        context: state.context,
        child: new SimpleDialog(
          title: new Text("发现新版本" + newVersion),
          children: <Widget>[
            new FlatButton(
              child: Text('下载'),
              onPressed: ()
              {
                valueChangedMethod(false);
                Navigator.of(state.context).pop();
              },
            ),
            new FlatButton(
              child: Text('以后再说'),
              onPressed: ()
              {
                valueChangedMethod(true);
              },
            ),
          ],
        ));
  }
}
