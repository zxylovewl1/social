import 'dart:ui';

import 'package:flutter/widgets.dart';

/*
 * 功能：屏幕相关工具类(需要优化)
 * 1：要设计稿假设是按iPhone6的尺寸设计的(iPhone6 750*1334)尺寸要给像素
 * 2：传入设计稿的px尺寸
 * 需要传入的键：
 * 传入的值类型：
 * 传入的值含义：
 * 是否必传 ：
 * 参考地址：https://blog.csdn.net/u011272795/article/details/82795477
 * 作者：郑朝军 on 2019/4/7 23:23
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 */
class ScreenUtil 
{
  static ScreenUtil mInstance;

  MediaQueryData mMediaQuery;

  /*
   * 设备分辨率
   */
  double mDevicePixelRatio;

  /*
   * 设计的宽度比如：iPhone6的尺寸设计的(iPhone6 750)
   */
  int mDesignWidth;

  /*
   * 设计的宽度比如：iPhone6的尺寸设计的(iPhone6 1334)
   */
  int mDesignHeight;

  static ScreenUtil getInstance() 
  {
    if (mInstance == null) 
    {
      mInstance = new ScreenUtil();
    }
    return mInstance;
  }

  /*
   * 默认按照(iPhone6 750*1334)尺寸进行设计
   */
  ScreenUtil({int width = 720, int height = 1439})
  {
    mMediaQuery = MediaQueryData.fromWindow(window);
    mDevicePixelRatio = mMediaQuery.devicePixelRatio;
    mDesignWidth = width;
    mDesignHeight = height;
  }

  /*
   * 获得屏幕高度(返回像素)
   */
  double getScreenWidth()
  {
    return mMediaQuery.size.width * mDevicePixelRatio;
  }

  /*
   * 获得屏幕宽度(返回像素)
   *
   */
  double getScreenHeight()
  {
    return mMediaQuery.size.height * mDevicePixelRatio;
  }

  /*
   * 获得状态栏的高度(返回像素)
   */
  double getStatusHeight()
  {
    return mMediaQuery.padding.top * mDevicePixelRatio;
  }

  /*
   * 获得底部栏的高度(返回像素)
   */
  double getBottomBarHeight()
  {
    return mMediaQuery.padding.bottom * mDevicePixelRatio;
  }

  /*
   * 获得设备的像素密度
   */
  double getDevicePixelRatio()
  {
    return mMediaQuery.devicePixelRatio;
  }

  /*
   * 每个逻辑像素的字体像素数，字体的缩放比例
   */
  double getTextScaleFactor()
  {
    return mMediaQuery.textScaleFactor;
  }

  /*
   * 计算设计搞的宽度和当前手机的宽度比例
   */
  double getScaleWidth()
  {
    return getScreenWidth() / mDesignWidth;
  }

  /*
   * 计算设计搞的高度和当前手机的高度比例
   */
  double getScaleHeight()
  {
    return getScreenHeight() / mDesignHeight;
  }

  /*
   * 根据真实手机比较设计稿的得出的宽度
   * @param width 设计的宽度(像素)
   */
  double setWidth(int width)
  {
    return width * getScaleWidth();
  }

  /*
   * 根据真实手机比较设计稿的得出的高度
   * @param height 设计的宽度(像素)
   */
  double setHeight(int height)
  {
    return height * getScaleHeight();
  }

  /*
   * 计算文本的字体的大小
   * @param fontSize 设计的字体大小(像素)
   * @param allowFontScaling 是否跟随系统文字大小变大【true=是】
   */
  double setSp(int fontSize, [allowFontScaling = true])
  {
    return allowFontScaling
        ? setWidth(fontSize) * getTextScaleFactor()
        : setWidth(fontSize);
  }
}
