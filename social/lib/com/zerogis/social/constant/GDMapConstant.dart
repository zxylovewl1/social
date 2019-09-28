import 'package:social/com/zerogis/social/resource/StringRes.dart';

/*
 * 类描述：高德地图全局控制变量
 * 作者：郑朝军 on 2019/5/10
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/5/10
 * 修改备注：
 */
class GDMapConstant
{
  static String PROVINCE = "湖北省"; // 注意关闭应用的时候要注意销毁

  static String CITY = "武汉市"; // 注意关闭应用的时候要注意销毁

  static String AREA = "洪山区"; // 注意关闭应用的时候要注意销毁

  static String ADDRESS = StringRes.company; // 注意关闭应用的时候要注意销毁

  static double LONGITUDE = 114.401362; // 注意关闭应用的时候要注意销毁(默认为东湖绿道经纬度)

  static double LATITUDE = 30.562587; // 注意关闭应用的时候要注意销毁(默认为东湖绿道经纬度)

  static double MAP_TILT = 0.0; // 倾斜程度

  static double MAP_BEARING = 0.0; // 控制当前可视区旋转角度

  static int MAP_PADDING = 5; // 经纬度范围和mapView边缘的空隙，单位像素。这个值适用于区域的四个边。

  static double MAP_ZOOM = 12.75; // 默认地图缩放级别

  static int POI_SEARCH_RANGE = 5000; // 默认地图POI周边搜索范围5000米

  static double DEFAULT_MAP_LINE_WIDTH = 10.0; // 默认地图线宽

  static String DEFAULT_MAP_LINE_COLOR = "#b8860b"; // 默认地图线的颜色
}
