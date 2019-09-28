/*
 * 类描述：主子类型定义
 * 作者：郑朝军 on 2019/6/14
 * 邮箱：1250393285@qq.com
 * 公司：武汉智博创享科技有限公司
 * 修改人：郑朝军 on 2019/6/14
 * 修改备注：
 */
class MajorMinorConstant
{
  /*
   * -------------------------业务级别相关------------------------------------
   */
  /*
   * 业务相关主类型
   */
  static final int MAJOR_BUSINESS = 98;

  /*
   * 以下主类型为99
   */
  static final int MINOR_USERDEP = 17; //用户与部门关联
  static final int MINOR_MEDIA = 45; //附件表
  static final int MINOR_DELEGATE = 62; //委办表
  static final int MINOR_SEQBILL = 64; //序号编码
  static final int MINOR_PROCCOMP = 65; //完结通知

  /*
   * 以下主类型为98
   */
  static final int MINOR_OA_WORKDAY = 4; //工作日
  static final int MINOR_OA_WEEK = 5; //周次
  static final int MINOR_OA_ASSET = 11; //资产表
  static final int MINOR_OA_ASSETUSE = 12; //资产领用记录
  static final int MINOR_OA_GIFT = 13; //礼品
  static final int MINOR_OA_GIFTIN = 14; //礼品入库
  static final int MINOR_OA_GIFTUSE = 15; //礼品领用
  static final int MINOR_OA_GIFTD = 16; //礼品领用申请单
  static final int MINOR_OA_BJBDN = 17; //笔记本电脑申请单
  static final int MINOR_OA_TASK = 21; //任务
  static final int MINOR_OA_CUSTOMER = 31; //客户
  static final int MINOR_OA_CONTACT = 32; //客户联系人
  static final int MINOR_OA_PRJ = 41; //项目
  static final int MINOR_OA_PRJMEM = 42; //项目成员
  static final int MINOR_OA_PRJMS = 43; //项目里程碑
  static final int MINOR_OA_PRJPROB = 44; //项目问题
  static final int MINOR_OA_PRJTASK = 45; //项目任务
  static final int MINOR_OA_PRJTIME = 46; //项目工时
  static final int MINOR_OA_PRJCONT = 47; //项目联系人
  static final int MINOR_HT_INFO = 51; //合同信息
  static final int MINOR_HT_INVOICE = 53; //发票信息
  static final int MINOR_HT_PAY = 54; //付款信息
  static final int MINOR_F_DDBXD = 61; //地大报销单
  static final int MINOR_HR_LEAVE = 71; //请假单
  static final int MINOR_HR_BUSTRIP = 72; //出差单
  static final int MINOR_HR_OUT = 73; //外出登记
  static final int MINOR_HR_PUNCH = 74; //补卡
  static final int MINOR_HR_CLOCKIN = 75; //打卡
  static final int MINOR_WM_MEET = 81; //周会
  static final int MINOR_WM_MEETMEM = 82; //周会参与人
  static final int MINOR_WM_MEETREC = 83; //周会记录
  static final int MINOR_OA_SEAL = 91; //用印申请单
  static final int MINOR_OA_HTPS = 92; //合同评审单
  static final int MINOR_OA_LINK = 151; //网址
  static final int MINOR_OA_AREA = 161; //区域
}
