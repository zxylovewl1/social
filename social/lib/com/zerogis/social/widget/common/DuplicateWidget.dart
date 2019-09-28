import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social/com/zerogis/social/constant/SoftwareConstant.dart';
import 'package:social/com/zerogis/social/font/IconFont.dart';
import 'package:social/com/zerogis/social/plugin/common/PhotoBrowsePlugin.dart';
import 'package:social/com/zerogis/social/widget/core/WidgetCreator.dart';
import 'package:weui/weui.dart';
import 'package:zpub_att/zpub_att.dart';
import 'package:zpub_bas/com/zerogis/zpubbase/constant/MarginPaddingHeightConstant.dart';
import 'package:zpub_bas/zpub_bas.dart';

/*
 * 附件组件,支持本地，网络图片显示，支持查看，编辑 <br/>
 * 需要传入的键：<br/>
 * 传入的值类型： <br/>
 * 传入的值含义：<br/>
 * 是否必传 ：
 */
class DuplicateWidget extends FuctionStateFulBase
{
  /*
   * 所有图片的集合
   */
  List<String> mMediaList;

  /*
   * 是否为编辑【true=编辑状态】 
   */
  final bool mIsEdit;

  /*
   * 是否为可空
   */
  final int mNullable;

  /*
   * 点击图片回调事件
   */
  ValueChanged<dynamic> valueChangedMethod;

  /*
   * 点击删除图片回调事件
   */
  ValueChanged<dynamic> valueDeleteMethod;

  DuplicateWidget({Key key,
    @required this.mMediaList,
    @required this.mIsEdit = true,
    @required this.valueChangedMethod,
    this.valueDeleteMethod,
    this.mNullable,})
      : super(key: key)
  {
    if (mMediaList == null)
    {
      this.mMediaList = new List();
    }
  }

  State<StatefulWidget> createState()
  {
    return new DuplicateWidgetState();
  }

  static String toStrings()
  {
    return "DuplicateWidget";
  }
}

/*
 * 组件功能 <br/>
 */
class DuplicateWidgetState<T extends DuplicateWidget> extends FuctionStateBase<T>
{
  /*
   * 当前组件是否入栈
   */
  bool usePushStack()
  {
    return false;
  }

  DuplicateWidgetState()
  {}

  void initState()
  {
    super.initState();
  }

  Widget build(BuildContext context)
  {
    return AttWidgetCreator.createCommonDuplicate(createGridViewItem(), nullable: widget.mNullable);
  }

  /*
   * 创建GridView条目
   */
  List<Widget> createGridViewItem()
  {
    List<Widget> listWidget = <Widget>[];
    createDefalutAddPhotoWidget(listWidget);
    for (int i = 0; i < widget.mMediaList.length; i++)
    {
      listWidget.add(createGridViewItemContent(widget.mMediaList[i], i));
    }
    return listWidget;
  }

  /*
   * 创建默认的添加照片的组件
   */
  void createDefalutAddPhotoWidget(List<Widget> list)
  {
    Widget content = new Container(
      margin: EdgeInsets.only(
        right: MarginPaddingHeightConstant.APP_MARGIN_PADDING_4,
      ),
      child: new GestureDetector(
        onTap: ()
        {
          doClickAddPhotoTap();
        },
        child: WidgetCreator.createCommonImage(
            "", icon: IconFont.iconaddto, color: Colors.grey),
      ),
    );
    list.add(content);
  }

  /*
   * 创建GridView条目内容
   */
  Widget createGridViewItemContent(String path, int position)
  {
    Widget content = new Container(
      margin: EdgeInsets.only(
        right: MarginPaddingHeightConstant.APP_MARGIN_PADDING_2,
      ),
      child: new GestureDetector(
        onLongPress: widget.mIsEdit ? ()
        {
          WeDialog.confirm(context)('确认删除?', title: '提示信息', onConfirm: ()
          {
            setState(()
            {
              widget.mMediaList.removeAt(position);
              widget.valueDeleteMethod(position);
            });
          });
        } : null,
        onTap: ()
        {
          doClickPhotoTap(path, position);
        },
        child: networkOrSdcard(path, position),
      ),
    );
    return content;
  }

  /*
   * 创建GridView条目内容
   */
  Widget createGridViewItemContentOld(String path, int position)
  {
    Widget content = new Container(
      margin: EdgeInsets.only(
        right: MarginPaddingHeightConstant.APP_MARGIN_PADDING_2,
      ),
      child: new GestureDetector(
        onTap: ()
        {
          doClickPhotoTap(path, position);
        },
        child: networkOrSdcard(path, position),
      ),
    );
    return content;
  }

  /*
   * 创建选择相册还是相机的一个BottomSheet
   */
  void createShowModalBottomSheet()
  {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context)
        {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new ListTile(
                leading: WidgetCreator.createCommonImage(
                    "", icon: Icons.photo_camera, color: Colors.grey),
                title: new Text("拍照"),
                onTap: ()
                {
                  doClickPhotoCamera();
                  Navigator.pop(context);
                },
              ),
              new ListTile(
                leading: WidgetCreator.createCommonImage(
                    "", icon: Icons.photo_library, color: Colors.grey),
                title: new Text("从手机相册选择"),
                onTap: ()
                {
                  doClickPhotoGallery();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  /*
   * 网络图片或者本地图片
   */
  Widget networkOrSdcard(String path, int position)
  {
    Widget body;
    if (path.contains(SoftwareConstant.NETWORK_HTTP) ||
        path.contains(SoftwareConstant.NETWORK_HTTPS))
    {
      body = WidgetCreator.createCommonImage(path, third: 2);
    }
    else
    {
      body = Image.file(new File(path));
    }
    return body;
  }

  /*
   * 图片浏览点击事件 
   */
  void doClickPhotoTap(String path, int position)
  {
    StateManager.getInstance().startWidegtState(new PhotoBrowsePlugin(widget.mMediaList, position,), this);
  }

  /*
   * 图片添加事件
   */
  void doClickAddPhotoTap()
  {
    if (widget.mIsEdit)
    {
      createShowModalBottomSheet();
    }
  }

  /*
   * 从相册中选取照片
   */
  Future<File> doClickPhotoGallery()
  async {
    File file = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//    String path =
//        await ImageJpeg.encodeJpeg(file.path, file.path, 100, 5000, 5000);
    if (file != null)
    {
      setState(()
      {
        widget.valueChangedMethod(file);
        widget.mMediaList.add(file.path);
//      widget.list.add(path);
      });
    }
  }

  /*
   * 相机拍照选择照片
   */
  Future<File> doClickPhotoCamera()
  async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 80);
//    String path =
//        await ImageJpeg.encodeJpeg(file.path, file.path, 100, 5000, 5000);
    if (file != null)
    {
      setState(()
      {
        widget.valueChangedMethod(file);
        widget.mMediaList.add(file.path);
//      widget.list.add(path);
      });
    }
  }
}
