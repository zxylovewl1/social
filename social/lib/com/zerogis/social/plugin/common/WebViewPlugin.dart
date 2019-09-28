import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/widget/custom/WebViewWidget.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_plugin/zpub_plugin.dart';

void main()
{
  runApp(new WebViewPlugin());
}

/*
 * 网页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class WebViewPlugin extends PluginStatefulBase
{
  final String url;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  WebViewPlugin({this.url, this.title, this.hideAppBar = false, this.backForbid = false, Key key, plugin})
      : super(key: key, plugin: plugin);

  State<StatefulWidget> createState()
  {
    return new WebViewPluginState();
  }

  static String toStrings()
  {
    return "WebViewPlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class WebViewPluginState extends PluginBaseState<WebViewPlugin>
{
  void initState()
  {
    super.initState();
    if (!CxTextUtil.isEmpty(widget.title))
    {
      mTitle = widget.title;
    }
    if (widget.hideAppBar)
    {
      hideTitleBar();
    }
  }

  Widget build(BuildContext context)
  {
    return buildBody(context, WebViewWidget(url: widget.url, backForbid: widget.backForbid));
  }
}
