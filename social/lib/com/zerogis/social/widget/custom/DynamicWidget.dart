import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/resource/StringRes.dart';

/*
 * 类描述：动态更新flutter组件。轻量级的json UI协议，与flutter widget代码非常相似
 * 参考地址:https://pub.dev/packages/dynamic_widget#-readme-tab-
 * 作者：郑朝军 on 2019/7/31
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/31
 * 修改备注：
 */
class DynamicWidget extends StatefulWidget
{
  String json;

  ClickListener mListener;

  DynamicWidget(this.json, {Key key, this.mListener}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new DynamicWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class DynamicWidgetState extends State<DynamicWidget>
{
  Widget build(BuildContext context)
  {
    return FutureBuilder<Widget>(
        future: _buildWidget(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot)
        {
          return snapshot.hasData ? SizedBox.expand(child: snapshot.data) : Text(StringRes.progressbar_text);
        });
  }

  Future<Widget> _buildWidget()
  async {
    return DynamicWidgetBuilder().build(widget.json, context, widget.mListener);
  }
}

