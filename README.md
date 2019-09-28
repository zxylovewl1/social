#### 介绍 b站APP视频讲解地址：社交 交友类  相亲类 约会 发布活动等
https://www.bilibili.com/video/av68281918/


#### b站主页视频讲解地址：Android/IOS/NDK/架构/性能优化/Flutter和Android基础框架/插件开发系列教程
https://space.bilibili.com/297978042?spm_id_from=333.788.b_765f7570696e666f.1



#### git仓库地址 欢迎start
https://gitee.com/zhengchaojun/social_contact.git

#### github仓库地址 欢迎start
https://github.com/zxylovewl1/social.git




#### 软件架构
<img src="https://i0.hdslb.com/bfs/album/19d926392c492c4c7503ae94e55c1abb1e0848e7.jpg" width="1000px" height="400px">


#### flutter_des-Androi-IOS代码插件库
1:Des加密flutter代码调用Android和ios代码


#### zpub_att-底层属性
https://github.com/zxylovewl1/zpub_att.git

1:属性层面，只放入通用属性相关适合于A，B，C类型的项目


#### zpub_bas-底层标题栏
https://github.com/zxylovewl1/zpub_bas.git

1:Framwork层只存放Util相关工具类和slot层和View(FuctionStateFulBase)层

2:注意：不需要依赖第三方库

3:注意：即使是添加工具类也不需要依赖第三方库，含有第三方库封装的工具类在其他模块中添加

4:注意：添加类时需要包含头部注释，方法注释，参数注释，每个方法需要经过测试过才可添加

5：注意：zpub_base的添加适用A类型项目，B类型项目，C类型项目 即不同类型的项目通用的类


#### zpub_dbmanager-数据库管理
https://github.com/zxylovewl1/zpub_dbmanager.git

1:只存放系统级别(major=99)的bean对象：表对象，系统级别的主子类型,数据库相关通用配置信息存放,管理类相关也放置此处,适用于A，B，C类型的项目，如果不适用则可不放此处

#### zpub_http-网络层
https://github.com/zxylovewl1/zpub_http.git

1：zpub_http为什么依赖zpub_bas因为需要做回调，里面集成了BaseService这个东西

2：可以不使用zpub_bas，可以直接使用zpub_http


#### zpub_plugin-插件层
https://github.com/zxylovewl1/zpub_plugin.git

1:将来插件机制只需要依赖zpub_dbmanager,因为以后考虑到插件机制会和本地数据库挂钩可能需要依赖比较好


#### zpub_sqflite-sqflite封装库
https://github.com/zxylovewl1/zpub_sqflite.git

1:封装了数据库相关的

#### zpub_svr-通用服务接口库
https://github.com/zxylovewl1/zpub_svr.git

1：zpub_svr 为什么需要依赖zpub_dbmanager考虑到通用服务需要查询本地数据库所以需要依赖


#### zpub_third_shard-本地存储
https://github.com/zxylovewl1/zpub_third_shard.git

1:通用层每一个项目都有可能会用到，建议其他的第三方库的封装放入其他里面,封装了数据库相关的，封装了本地持久化相关的

#### zpub_third-第三方库
https://github.com/zxylovewl1/zpub_third.git

1:通用层每一个项目都有可能会用到，建议其他的第三方库的封装放入其他里面

#### 软件架构基础框架 使用：
https://gitee.com/zhengchaojun/Flutter_Design.git


#### 能够学习到哪些东西
Dio2.0:Dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消等操作。视频中将全面学习和使用Dio的操作。

Swiper：swiper滑动插件的使用，使用Swiper插件图片的切换效果。

路由Fluro：Flutter的路由机制很繁琐，如果是小型应用还勉强，但是真实开发我们都会使用企业级的路由机制，让路由清晰可用。视频中也会使用Fluro进行路由配置.Fluro也是目前最好的企业级Flutter路由。

屏幕适配：手机屏幕大小不同，布局难免有所不同，在视频中将重点讲述Flutter的开发适配，一次开发适配所有屏幕，学完后可以都各种屏幕做到完美适配。

**上拉加载 **：如果稍微熟悉Flutter一点的小伙伴一定知道Flutter没有提供上拉加载这种插件，自己开发时非常麻烦的。在课程中我将带着大家制作上拉加载效果。

本地存储：本地存储是一个App的必要功能，在项目中也大量用到了本地存储功能。

复杂页面的布局：会讲到如何布局复杂页面，如果解决多层嵌套地狱，如何写出优雅的代码。

其他知识点：还会设计到很多其他知识点，基本的Widget操作就超过50个，是目前市面教程中最多的实战课程。

随时增加的知识技巧：如果你参加了预售，你可以根据自己的需求，提交需要增加的知识点，会根据需求的普遍性 ，随时增加知识点(全部视频60集左右)。

#组件化开发，完美复原APP核心页面

Flutter打包Android能够直接使用的AAR

Flutter打包静态连接库IOS能够直接使用的：

IOS调用Flutter代码：目的flutter项目集成到原生项目中

Android调用Flutter代码：目的flutter项目集成到原生项目中


#### 功能说明
<img src="https://images.gitee.com/uploads/images/2019/0927/203229_8741e5e3_682499.jpeg" width="400px" height="800px">

<img src="https://images.gitee.com/uploads/images/2019/0927/203415_409a0886_682499.png" width="400px" height="800px">

<img src="https://i0.hdslb.com/bfs/album/a8b3b73c864c6210dfe2d88f1c182edffdb30240.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/9493252a083b563133a6efbe3b9e299755a12fe0.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/fd6a65625981bece9e22b97d1d0bbb6e29ddd283.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/46b140e10678cde83a84b631cf8be5c4e853d9af.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/2cdd8f452986f2b1c5260d1885e79b081fb30800.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/b8f0e0c3b8826c9aeb416bc20173082c3d22399b.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/53a264eadedcb59c5730a633d4f6736ae0efb29d.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/710400b6b921bdc649e96315915dbb4506a64245.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/b4c2b5301d51b2eaf97c033500b53f544cf4b2b4.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/504799458b7b8d719f7a90dad48554d37efa64d0.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/8c2a085c74a04a0d0ec6e4799306bdc92ca1e38a.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/7453aa4bd9a4e1f68fbbd55e50d52f450b550d5f.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/48b88ee30c3d8d3599d3c5ff17ee7fee72c7410b.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/dd96a9b82662405cf41e4c660452a0e4bce9d00b.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/8467bb6e278539c3ba7a31cd3c0704ce551791f1.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/330777188ee4bc759b9fb9419f046c764bb19700.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/0e66a8870c9c5cbcd86d7354235a3a3397b96f0d.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/23bd7b177ae932db16bfc1e79ebf450b2b4d541a.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/a725054e8a15d2ad7e02c596fa2eb5c24a007557.png" width="400px" height="800px">
<img src="https://i0.hdslb.com/bfs/album/4418f7325d5d9413b323856b26740d6887fbfeca.png" width="400px" height="800px">


#### 欢迎关注我的公众号：每天自动推送Android/IOS/NDK/架构/性能优化/Flutter和Android基础框架/插件开发系列教程 相关文章：含微信自动推送文章讲解
<img src="https://i0.hdslb.com/bfs/album/191a08c83288ec3d626a5f182a23a69ab55393a3.jpg" width="400px" height="400px">

#### 欢迎关注我的QQ群
<img src="https://i0.hdslb.com/bfs/album/e24ac08ffbd5c7b06d85ccb3969d79867ad7abc1.png" width="400px" height="400px">

#### 赞赏
<img src="https://i0.hdslb.com/bfs/album/b6745731127af1490a9ea8611451369eed3823ca.png" width="400px" height="400px">


#### 合作
重点来了，我们诚邀各位想自主创业愿意挑战有共识的骚年一块干！ 我们能够提供给你的是：
 1.优质的中高档特色Flutter/Flutter_web/JAVA/IOS/安卓/NDK/架构/数据结构算法/性能优化/Flutter和Android基础框架 源代码 （这是我们经过4年的转身）

 2.优质的教学视频，如果你是做卖视频教学 的我们绝对欢迎

 3. 我们希望的是双赢，给足够的空间您赚取利润


###   我们需要的是这样的骚年：
 1.敢于挑战自我，有想法有行动，认同我们销售的理念 
2.热衷于销售，可以使微信销售、淘宝店、实体店，直播 
3.兼职、全职皆可 

若希望长期合作，有想法的骚年可以豆油，可以加QQ： 446700606 上新什么的都会在有推送。
欢迎关注我的公众号
搜索：郑朝军

欢迎关注我的QQ群
446700606

