import 'package:flutter/material.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new CopyPlugin());
}

/*
 * 模板页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class CopyPlugin extends PluginStatefulBase
{
  CopyPlugin({Key key, plugin}) : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new CopyPluginState();
  }

  static String toStrings()
  {
    return "CopyPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class CopyPluginState extends PluginBaseState<CopyPlugin>
{
  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        new Column(
          children: <Widget>[
            new IconButton(
              icon: new Icon(Icons.delete),
              onPressed: ()
              {
                showToast("hellow world");
              },
            ),
          ],
        ));

    return widget;
  }

  void onClick(Widget widget)
  {

  }
}
