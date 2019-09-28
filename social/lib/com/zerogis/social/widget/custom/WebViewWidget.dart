import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/resource/StringRes.dart';

/*
 * 类描述：webview组件
 * 参考地址:https://pub.dev/
 * 作者：郑朝军 on 2019/7/31
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/31
 * 修改备注：
 */
class WebViewWidget extends StatefulWidget
{
  final String url;
  final bool backForbid;

  WebViewWidget({this.url, this.backForbid = false, Key key}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new WebViewWidgetState();
  }
}

const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

/*
 * 组件功能 <br/>
 */
class WebViewWidgetState extends State<WebViewWidget>
{
  bool exiting = false;
  final webviewReference = new FlutterWebviewPlugin();
  var _onUrlChanged;
  var _onStateChanged;
  var _onHttpError;

  @override
  void initState()
  {
    super.initState();
    webviewReference.close();
    _onUrlChanged = webviewReference.onUrlChanged.listen((String url)
    {
      print(url);
    });
    _onStateChanged = webviewReference.onStateChanged.listen((WebViewStateChanged state)
    {
      print(state.url);

      switch (state.type)
      {
        case WebViewState.shouldStart:
          break;
        case WebViewState.startLoad:
          if (_isToMain(state.url) && !exiting)
          {
            if (widget.backForbid)
            {
              // 不允许打开其他页面
              webviewReference.launch(widget.url);
            }
            else
            {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        case WebViewState.abortLoad:
          break;
        case WebViewState.finishLoad:
          break;
      }
    });
    _onHttpError = webviewReference.onHttpError.listen((WebViewHttpError error)
    {
      print(error.code);
      print(error.url);
    });
  }

  _isToMain(String url)
  {
    bool contain = false;
    for (final value in CATCH_URLS)
    {
      if (url?.endsWith(value) ?? false)
      {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  void dispose()
  {
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webviewReference.dispose();
    // 先销毁webview再销毁页面
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return WebviewScaffold(
      url: widget.url,
      withZoom: true,
      hidden: true,
      withLocalStorage: true,
      initialChild: Container(
        color: Colors.white,
        child: Center(
          child: Text(StringRes.progressbar_text),
        ),
      ),
    );
  }
}

