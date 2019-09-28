import 'package:amap_location/amap_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:social/com/zerogis/social/constant/GDMapConstant.dart';
import 'package:social/com/zerogis/social/constant/KeyConstant.dart';

/*
 * 类描述：高精度定位(新版高德定位SDK)
 * 作者：郑朝军 on 2019/5/10
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/5/10
 * 修改备注：
 */
class LocationManager
{
  static LocationManager mInstance;

  static LocationManager getInstance()
  {
    if (mInstance == null)
    {
      mInstance = new LocationManager();
    }
    return mInstance;
  }

  LocationManager()
  {
    AMapLocationClient.setApiKey(KeyConstant.APP_KEY_GD);
  }

  /*
   * 初始化定位：启动系统所需选项
   */
  LocationManager initLocation()
  {
    AMapLocationClient.startup(new AMapLocationOption(
        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
    return this;
  }

  /*
   * 直接获取到定位，不必先启用监听
   */
  void getLocation(ValueChanged<AMapLocation> valueChangedMethod)
  {
    AMapLocationClient.getLocation(true).then((AMapLocation location)
    {
      setDefaultLocation(location);
      valueChangedMethod(location);
    });
  }

  /*
   * 直接获取到定位，不必先启用监听,不必要回调
   */
  void getLocations()
  {
    AMapLocationClient.getLocation(true).then((AMapLocation location)
    {
      setDefaultLocation(location);
    });
  }

  /*
   * 启动位置时时改变监听
   */
  void startLocationListen(ValueChanged<AMapLocation> valueChangedMethod)
  {
    AMapLocationClient.onLocationUpate.listen((AMapLocation location)
    {
      valueChangedMethod(location);
      setDefaultLocation(location);
    });
    startLocation();
  }

  /*
   * 启动位置时时改变监听
   */
  void startLocationListens()
  {
    AMapLocationClient.onLocationUpate.listen((AMapLocation location)
    {
      setDefaultLocation(location);
    });
    startLocation();
  }

  /*
   * 设置默认位置的相关值
   */
  void setDefaultLocation(AMapLocation location)
  {
    GDMapConstant.PROVINCE = location.province;
    GDMapConstant.CITY = location.city;
    GDMapConstant.AREA = location.district;
    GDMapConstant.LATITUDE = location.latitude;
    GDMapConstant.LONGITUDE = location.longitude;
    GDMapConstant.ADDRESS = location.formattedAddress;
  }

  /*
   * 启动监听位置改变
   */
  void startLocation()
  {
    AMapLocationClient.startLocation();
  }

  /*
   * 关闭定位
   */
  void stopLocation()
  {
    destroyLocation();
  }

  /*
   * 关闭定位
   */
  void destroyLocation()
  {
    AMapLocationClient.shutdown();
  }
}
