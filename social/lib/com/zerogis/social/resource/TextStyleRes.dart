import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:social/com/zerogis/social/resource/APPColorRes.dart';

/*
 * 类描述：文本常用风格
 * 作者：郑朝军 on 2019/5/6
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/5/6
 * 修改备注：
 */
class TextStyleRes
{
//  <dimen name="dimen_smallest">2dp</dimen>
//  <dimen name="dimen_smaller">3dp</dimen>
//  <dimen name="dimen_small">5dp</dimen>
//  <dimen name="dimen_small_middle">7dp</dimen>
//  <dimen name="dimen_middle">10dp</dimen>
//  <dimen name="dimen_middle_large">12dp</dimen>
//  <dimen name="dimen_large">15dp</dimen>
//  <dimen name="dimen_larger">17dp</dimen>
//  <dimen name="dimen_largest">20dp</dimen>

//  <!-- 分界线 -->
//  <dimen name="dimen_tabwidget_text">12sp</dimen>
//  <dimen name="dimen_textview_text">16sp</dimen>
//  <dimen name="dimen_textview_text_small">14sp</dimen>
//  <dimen name="dimen_textview_text_smaller">13sp</dimen>
//  <dimen name="dimen_textview_text_small_middle">16sp</dimen>
//  <dimen name="dimen_textview_text_small_middler">17sp</dimen>
//  <dimen name="dimen_textview_text_smallest">12sp</dimen>
//  <dimen name="dimen_textview_text_middle">18sp</dimen>
//  <dimen name="dimen_textview_text_large">19sp</dimen>
//  <dimen name="dimen_edittext_text">15sp</dimen>
//  <dimen name="dimen_button_text">16sp</dimen>
//  <dimen name="dimen_title_text">18sp</dimen>

  static const TextStyle text_smallest_fontw900 = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w900);

  static const TextStyle text_color_text1_smallest = TextStyle(
      fontSize: 12, color: APPColorRes.text_color_text1, fontFamily: 'iconfont'); // 12

  static const TextStyle text_color_text_grey_smaller = TextStyle(
      fontSize: 13, color: Colors.grey, fontFamily: 'iconfont'); // 13

  static const TextStyle text_color_text1_smaller = TextStyle(
      fontSize: 13,
      color: APPColorRes.text_color_text1,
      fontFamily: 'iconfont'); // 13

  static const TextStyle text_color_text1_small = TextStyle(
      fontSize: 15,
      color: APPColorRes.text_color_text1,
      fontFamily: 'iconfont'); // 15

  static const TextStyle text_color_text1_larger_fontw900 = TextStyle(
      fontSize: 17, color: APPColorRes.text_color_text1, fontWeight: FontWeight.w900, fontFamily: 'iconfont'); // 17

  static const TextStyle text_red_color_text1_small = TextStyle(
      fontSize: 15,
      color: Colors.red,
      fontFamily: 'iconfont'); // 15

  static const TextStyle text_color_text1_larger = TextStyle(
      fontSize: 17,
      color: APPColorRes.text_color_text1,
      fontFamily: 'iconfont'); // 17

  static const TextStyle text_color_text4_larger = TextStyle(
      fontSize: 17,
      color: APPColorRes.text_color_text4,
      fontFamily: 'iconfont'); // 17


  static const TextStyle text_color_text1_largest = TextStyle(
      fontSize: 20,
      color: APPColorRes.text_color_text1,
      fontFamily: 'iconfont'); // 20
}
