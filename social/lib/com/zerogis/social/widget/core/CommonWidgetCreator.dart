import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/resource/TextStyleRes.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MapKeyConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';
import 'package:zpub_dbmanager/com/zerogis/zpubDbManager/constant/FldConstant.dart';

/*
 * 功能：组件库,用于创建常用的组件：类似Android中layout文件中common_progressbar.xml相关
 * 需要传入的键：
 * 传入的值类型：
 * 传入的值含义：
 * 是否必传 ：
 * 作者：郑朝军 on 2019/4/7 23:23
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 */
class CommonWidgetCreator
{
  /*
   * 创建顶部是图标底部文字的组件<br/>
   * @param map 举例：{title:请假,icon:0x123}
   */
  static Widget createCommonTopImgText(Map<String, dynamic> map,
      {GestureTapCallback onTap})
  {
    return new GestureDetector(
      child: new Column(
        children: <Widget>[
          WidgetCreator.createCommonImage(
              map[MapKeyConstant.MAP_ICON], width: 35,
              height: 35,
              fit: BoxFit.fill),
          new Text(map[MapKeyConstant.MAP_KEY_VALUE_TITLE],
              style: TextStyleRes.text_color_text1_smallest)
        ],
      ),
      onTap: onTap,
    );
  }

  /*
   * 创建顶部是图标底部文字的组件<br/>
   * @param map 举例：{title:请假,icon:0x123}
   */
  static Widget createCommonTopImgText2(Map<String, dynamic> map,
      {GestureTapCallback onTap})
  {
    return new GestureDetector(
      child: new Column(
        children: <Widget>[
          WidgetCreator.createCommonImage(
              "assets/images/" + map[MapKeyConstant.MAP_ICON] + ".png",
              width: 35,
              height: 35,
              fit: BoxFit.fill),
          new Text(map[FldConstant.FLD_NAMEC],
              style: TextStyleRes.text_color_text1_smallest)
        ],
      ),
      onTap: onTap,
    );
  }

  /*
   * 创建左边是图标旁边是文字最右边是图片的组件<br/>
   * @param map 举例：{title:请假,icon:0x123,argb:255, 245, 245, 245}
   */
  static Widget createCommonLeftImgText(Map<String, dynamic> map,
      {Function onClick, double size: 18})
  {
    return new WeCell(
      label: new Chip(
        avatar: WidgetCreator.createCommonImage(
            map[MapKeyConstant.MAP_ICON], width: size, height: size, fit: BoxFit.fill),
        label: new Text(map[MapKeyConstant.MAP_KEY_VALUE_TITLE]),
        labelPadding: EdgeInsets.only(left: 5),
        backgroundColor: Colors.white,),
      content: new Icon(
        Icons.arrow_forward_ios, size: 15, color: Colors.grey,),
      onClick: onClick,
    );
  }

  /*
   * 创建左边是图标旁边是文字最右边是 图片和文字 的组件<br/>
   * @param map 举例：{title:请假,content:请假,icon:0x123,argb:255, 245, 245, 245}
   */
  static Widget createLeftImgTextImg(Map<String, dynamic> map,
      {Function onClick, double size: 18})
  {
    return new WeCell(
      label: new Chip(
        avatar: WidgetCreator.createCommonImage(
            map[MapKeyConstant.MAP_ICON], width: size, height: size, fit: BoxFit.fill),
        label: new Text(map[MapKeyConstant.MAP_KEY_VALUE_TITLE]),
        labelPadding: EdgeInsets.only(left: 5),
        backgroundColor: Colors.white,),
      content: map['content'],
      footer: new Icon(
        Icons.arrow_forward_ios, size: 15, color: Colors.grey,),
      onClick: onClick,
    );
  }

  /*
   * 创建左边是图标旁边是文字最右边是图片的组件<br/>
   * @param map 举例：{title:请假,icon:0x123,argb:255, 245, 245, 245}
   */
  static Widget createCommonLeftImgTextOld(Map<String, dynamic> map,
      {Function onClick})
  {
    List<int> argb = ArrayUtil.stringToIntArray(map[MapKeyConstant.MAP_ARGB]);
    return new WeCell(
      label: new Chip(
        avatar: WidgetCreator.createCommonImage(
            map[MapKeyConstant.MAP_ICON], size: 18,
            color: Color.fromARGB(argb[0], argb[1], argb[2], argb[3])),
        label: new Text(map[MapKeyConstant.MAP_KEY_VALUE_TITLE]),
        labelPadding: EdgeInsets.only(left: 5),
        backgroundColor: Colors.white,),
      content: new Icon(
        Icons.arrow_forward_ios, size: 15, color: Colors.grey,),
      onClick: onClick,
    );
  }

  /*
   * 创建列行底部为文本组件
   * @param data1 文本1
   * @param data2 文本2
   * @param data3 文本3
   * @param style1 文本格式1
   * @param style2 文本格式2
   * @param style3 文本格式3
   */
  static Widget createTextLeftTextTop(String data1, String data2, String data3,
      {TextStyle style1, TextStyle style2, TextStyle style3})
  {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Flexible(
              child: new Container(
                margin: const EdgeInsets.only(top: 5),
                child: new Text(
                  data1,
                  style: style1 ?? TextStyleRes.text_color_text1_smallest,
                ),
              ),
              flex: 1,
            ),
            new Flexible(
              child: new Container(
                margin: const EdgeInsets.only(top: 5),
                child: new Text(
                  data2,
                  style: style2 ?? TextStyleRes.text_color_text1_smallest,
                ),
              ),
              flex: 1,
            ),
          ],
        ),
        new Text(
          data3,
          style: style3 ?? TextStyleRes.text_color_text1_smallest,
        ),
      ],
    );
  }


  /*
   * 创建左边为图片右边为文本
   */
  static Widget createImgLeftTextRight(icon,
      { @required color, @required title, @required describe, @required time, @required bage, @required double imgSize: 52,
        TextStyle styleTitle, TextStyle styleTime, TextStyle styleDescribe, TextStyle styleDage, Widget column})
  {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 15),
                child: WidgetCreator.createCommonImage(
                    icon, icon: (icon is IconData) ? icon : null,
                    size: imgSize,
                    color: color,
                    width: imgSize,
                    height: imgSize),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Flexible(
                              child: Text(title, style: styleTitle ?? TextStyleRes.text_color_text1_larger),
                              flex: DigitValueConstant.APP_DIGIT_VALUE_2,
                            ),
                            new Flexible(
                              child: Text(time, style: styleTime ?? TextStyleRes.text_color_text1_smaller),
                              flex: DigitValueConstant.APP_DIGIT_VALUE_1,
                            ),
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Flexible(
                              child: Text(describe, style: styleDescribe ?? TextStyleRes.text_color_text_grey_smaller),
                              flex: DigitValueConstant.APP_DIGIT_VALUE_4,
                            ),
                            new Flexible(
                              child: CxTextUtil.isEmptyObject(bage) ? new Container(width: 0, height: 0,) : WeBadge(
                                  child: bage,
                                  color: Colors.red,
                                  textStyle: styleDage ?? TextStyleRes.text_color_text1_smaller),
                              flex: DigitValueConstant.APP_DIGIT_VALUE_1,
                            ),
                          ],),
                        column ?? Container(width: 0, height: 0,),
                      ]
                  )
              )
            ]
        )
    );
  }
}
