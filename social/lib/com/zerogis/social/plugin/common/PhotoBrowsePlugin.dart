import 'dart:io';

import 'package:flutter/material.dart';
import 'package:social/com/zerogis/social/constant/SoftwareConstant.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_bas/zpub_bas.dart';

/*
 * 图片浏览页 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class PhotoBrowsePlugin extends FuctionStateFulBase
{
  /*
   * 要显示图片的位置
   */
  int mIndex;

  /*
   * 要显示图片的集合
   */
  List<String> list;

  PhotoBrowsePlugin(this.list,
      this.mIndex, {
        Key key,
      })
      : assert(list != null),
        assert(mIndex != null),
        super(key: key);

  State<StatefulWidget> createState()
  {
    return new PhotoBrowsePluginState();
  }

  static String toStrings()
  {
    return "PhotoBrowsePlugin";
  }
}

/*
 * 页面功能 <br/>
 */
class PhotoBrowsePluginState extends FuctionStateBase<PhotoBrowsePlugin>
{
  PhotoBrowsePluginState()
  {
    mTitle = '相片浏览';
  }

  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    Widget widget = buildBody(
        context,
        new WillPopScope(
            child: createSwiper(),
            onWillPop: ()
            {
              finish();
            }));
    return widget;
  }

  Widget createSwiper()
  {
    return new WeSwipe(
        autoPlay: false,
        defaultIndex: widget.mIndex,
        itemCount: CxTextUtil.isEmptyList(widget.list) ? 1 : widget.list.length,
        itemBuilder: (index)
        {
          return WidgetCreator.createCommonZoomableImage(networkOrSdcard(widget.list[index]));
        }
    );
  }

  /*
   * 网络图片或者本地图片
   */
  ImageProvider networkOrSdcard(String path)
  {
    ImageProvider body;
    if (path.contains(SoftwareConstant.NETWORK_HTTP) ||
        path.contains(SoftwareConstant.NETWORK_HTTPS))
    {
      body = new NetworkImage(path);
    }
    else
    {
      body = new FileImage(new File(path));
    }
    return body;
  }
}
