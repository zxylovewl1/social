import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:weui/weui.dart';

/*
 * 类描述：顶部自动打卡成功组件
 * 作者：郑朝军 on 2019/7/24
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/7/24
 * 修改备注：
 */
class DrawerTopWidget extends StatefulWidget
{
  /*
   * 按钮点击事件
   */
  Function mOnClick;

  /*
   * 按钮文本
   */
  dynamic mBtnText;

  /*
   * 标题
   */
  String mTitle;

  /*
   * 内容
   */
  String mContent;

  /*
   * 图标
   */
  IconData mIcon;

  DrawerTopWidget({Key key, this.mBtnText, this.mOnClick, this.mTitle, this.mContent, this.mIcon}) : super(key: key);

  State<StatefulWidget> createState()
  {
    return new DrawerTopWidgetState();
  }
}

/*
 * 组件功能 <br/>
 */
class DrawerTopWidgetState extends State<DrawerTopWidget>
{
  Widget build(BuildContext context)
  {
    return new Column(children: <Widget>[
      new Row(
        children: <Widget>[
          new Icon(widget.mIcon, size: 40, color: Colors.blue,),
          new SizedBox(width: 15,),
          new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            new Text(
              widget.mTitle,
              style: TextStyleRes.text_color_text1_larger,
            ),
            new Text(
              widget.mContent,
              style: TextStyleRes.text_color_text_grey_smaller,
            ),
          ],),
        ],
      ),
      new SizedBox(height: 20,),
      new WeButton(
        widget.mBtnText,
        theme: WeButtonType.primary, onClick: widget.mOnClick,
      ),
    ],);
  }
}