import 'package:social/com/zerogis/social/manager/LocationManager.dart';
import 'package:zpub_sqflite/zpub_sqflite.dart';
/*
 * 类描述：软件初始化
 * 作者：郑朝军 on 2019/5/10
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改备注：
 */
class SoftwareApplication
{
  static SoftwareApplication mInstance;

  static SoftwareApplication getInstance()
  {
    if (mInstance == null)
    {
      mInstance = new SoftwareApplication();
    }

    return mInstance;
  }

  void onCreate()
  {
    initDataSourceEngine();
    initAMapLocation();
    initDB();
    initEventBus();
  }

  /*
   * 初始化高德地图定位相关
   */
  void initAMapLocation()
  {
    LocationManager.getInstance().initLocation(); //.getLocations(); // 初始化一次位置
  }

  /*
   * 初始化数据源引擎
   */
  void initDataSourceEngine()
  {
  }

  /*
   * 初始化数据库
   */
  void initDB()
  {
    SQLiteConfigConstant.DATABASE_SQL_PATH.add("assets/sql/create_table.sql");
    SQLiteConfigConstant.DATABASE_SQL_PATH.add("assets/sql/entity.sql");
    SQLiteConfigConstant.DATABASE_SQL_PATH.add("assets/sql/fld.sql");
    SQLiteConfigConstant.DATABASE_SQL_PATH.add("assets/sql/fldvalue.sql");
    SQLiteConfigConstant.DATABASE_SQL_PATH.add("assets/sql/zbcx.sql");
    SQLiteDBMethod.getInstance();
  }

  /*
   * 初始化EventBus对象
   */
  void initEventBus()
  {
  }
}
