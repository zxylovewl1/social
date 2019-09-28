import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:social/com/zerogis/social/constant/SoftwareConstant.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/DigitValueConstant.dart';

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
class WidgetCreator
{
  /*
   * 创建公共网络图片:支持本地，iconfont，和网络图片<br/>
   */
  static Widget createCommonSizedBox({double width, double height})
  {
    return new SizedBox(width: width, height: height);
  }

  /*
   * 创建公共网络图片:支持本地，iconfont，和网络图片<br/>
   */
  static Widget createCommonImage(dynamic imageUrl,
      {BoxFit fit,
        double scale: 1.0,
        int third: 1,
        AlignmentGeometry alignment: Alignment.center,
        LoadingErrorWidgetBuilder errorWidget,
        PlaceholderWidgetBuilder placeholder,
        double width,
        Color color,
        double size,
        IconData icon,
        double height})
  {
    Widget image;
    if (icon != null || imageUrl.length < DigitValueConstant.APP_DIGIT_VALUE_10)
    {
      image = new Icon(
        icon ?? IconData(int.parse(imageUrl), fontFamily: IconFont.getFamily()),
        color: color, size: size,);
    }
    else if (imageUrl.contains(SoftwareConstant.SOFTWARE_ASSETS))
    {
      image = new Image(
        fit: fit,
        alignment: alignment,
        width: width,
        height: height,
        color: color,
        image: AssetImage(imageUrl),
      );
    }
    else
    {
      if (third == DigitValueConstant.APP_DIGIT_VALUE_1)
      {
        image = new CachedNetworkImage(
          fit: fit,
          alignment: alignment,
          imageUrl: imageUrl,
          color: color,
          errorWidget: errorWidget,
          placeholder: placeholder,
          height: height,
        );
      }
      else
      {
        image = new Image(
          fit: fit,
          alignment: alignment,
          width: width,
          color: color,
          height: height,
          image: new NetworkImage(
            imageUrl,
            scale: scale,
          ),
        );
      }
    }
    return image;
  }

  /*
   * 创建公共可以缩放的图片<br/>
   */
  static Widget createCommonZoomableImage(ImageProvider image)
  {
    return PhotoView(imageProvider: image);
  }
}
