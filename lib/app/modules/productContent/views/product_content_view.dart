import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/productContent/views/first_page_view.dart';
import 'package:getxclidemo01/app/modules/productContent/views/second_page_view_view.dart';
import 'package:getxclidemo01/app/modules/productContent/views/third_page_view_view.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';
import '../views/cart_item_num_view.dart';
import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("${Get.arguments}  sid:参数");
    return Scaffold(
        // extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenAdapter.height(120)),
            child: _appBarInit(controller, context)),
        body: _appBodyStack());
  }

  _appBodyStack() {
    // ProductContentController controller = Get.find();
    return Stack(
      children: [
        _appBody(),
        _bottomPostionCart(),
        Obx(() => controller.showSubTab.value ? _subHeader() : Text(""))
      ],
    );
  }

  _appBody() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          FirstPageView(showBottomArrt),
          SecondPageViewView(_subHeader),
          ThirdPageViewView(),
        ],
      ),
    );
  }

  //底部购物车 立即购买
  _bottomPostionCart() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        height: ScreenAdapter.height(180),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
              width: ScreenAdapter.width(2),
              color: Colors.black12,
            )),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                width: ScreenAdapter.width(200),
                height: ScreenAdapter.height(160),
                child: InkWell(
                  onTap: () {
                    Get.toNamed("/cart");
                  },
                  child: const Column(
                    children: [Icon(Icons.shopping_cart), Text("购物车")],
                  ),
                ),
              ),
              _bottom2btn(true)
            ],
          ),
        ));
  }

  _bottom2btn(bool showBottomSheetB) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: ScreenAdapter.height(144),
                padding: EdgeInsets.only(right: ScreenAdapter.width(30)),
                decoration: BoxDecoration(color: Colors.white),
                child: ElevatedButton(
                  onPressed: () {
                    if (showBottomSheetB) {
                      showBottomArrt();
                      controller.bottomSheetAction = 2;
                    } else {
                      controller.bottomSheetAction = 2;
                      controller.addCart();
                    }
                  },
                  child: Text("加入购物车"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(right: ScreenAdapter.width(30)),
                decoration: BoxDecoration(color: Colors.white),
                height: ScreenAdapter.height(144),
                child: ElevatedButton(
                  onPressed: () {
                    if (showBottomSheetB) {
                      showBottomArrt();
                      controller.bottomSheetAction = 3;
                    } else {
                      controller.bottomSheetAction = 3;
                      controller.buy();
                    }
                  },
                  child: Text("立即购买"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                ),
              ))
        ],
      ),
    );
  }

//商品详情的选项卡
  _subHeader() {
    return Positioned(
      left: 0,
      right: 0,
      top: ScreenAdapter.kStatusBarHeight() + ScreenAdapter.height(120),
      child: Container(
        color: Colors.white,
        height: ScreenAdapter.height(120),
        child: Row(
          children: controller.tabSubList.map((v) {
            return Expanded(
                flex: 1,
                child: Obx(() => InkWell(
                      onTap: () {
                        controller.changeSubTabSelected(v["id"]);
                        print("$v + ${controller.subTabSelectedIndex.value}");
                      },
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(v["title"],
                              style: TextStyle(
                                  color: controller.subTabSelectedIndex.value ==
                                          v["id"]
                                      ? Colors.red
                                      : Colors.black))),
                    )));
          }).toList(),
        ),
      ),
    );
  }

//appbar初始化
  _appBarInit(ProductContentController controller, BuildContext context) {
    var opacity = controller.opacity;
    return Obx(() => AppBar(
        backgroundColor: Colors.white.withOpacity(opacity.value),
        leading: Container(
          // margin: EdgeInsets.only(right: ScreenAdapter.width(44)),
          // width: ScreenAdapter.width(88),
          // height: ScreenAdapter.height(88),
          // color: Colors.red,
          alignment: Alignment.center,
          child: SizedBox(
            width: ScreenAdapter.width(100),
            height: ScreenAdapter.height(100),
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(CircleBorder())),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: ScreenAdapter.width(44)),
            width: ScreenAdapter.width(88),
            height: ScreenAdapter.height(88),
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.file_upload_outlined),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(CircleBorder())),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: ScreenAdapter.width(44)),
            width: ScreenAdapter.width(88),
            height: ScreenAdapter.height(88),
            child: ElevatedButton(
              onPressed: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(ScreenAdapter.height(920),
                        ScreenAdapter.height(260), ScreenAdapter.width(40), 0),
                    items: [
                      PopupMenuItem(child: Icon(Icons.home)),
                      PopupMenuItem(child: Icon(Icons.message)),
                      PopupMenuItem(child: Icon(Icons.share)),
                    ]);
              },
              child: Icon(Icons.more_horiz_outlined),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(CircleBorder())),
            ),
          ),
        ],
        elevation: 0,
        title: controller.showTab.value
            ? _navigationTitle(controller)
            : Text("")));
  }

//头部三个选项
  Widget _navigationTitle(ProductContentController controller) {
    List<Widget> subTitles = [];
    subTitles.addAll([_sizeBoxWidget()]);
    List<Widget> mainTitles = controller.tabList.map((e) {
      return InkWell(
        onTap: () {
          controller.selectedTapIndex.value = e["id"];
          if (e["id"] == 1) {
            Scrollable.ensureVisible(
                controller.gk1.currentContext as BuildContext,
                duration: Duration(milliseconds: 100));
          } else if (e["id"] == 2) {
            Scrollable.ensureVisible(
                controller.gk2.currentContext as BuildContext,
                duration: Duration(milliseconds: 100));
            Timer(Duration(milliseconds: 101), () {
              controller.scrollController.jumpTo(
                  controller.scrollController.position.pixels -
                      ScreenAdapter.height(120));
            });
          } else {
            Scrollable.ensureVisible(
                controller.gk3.currentContext as BuildContext,
                duration: Duration(milliseconds: 100));
            Timer(Duration(milliseconds: 120), () {
              controller.scrollController.jumpTo(
                  controller.scrollController.position.pixels -
                      ScreenAdapter.height(88));
            });
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              e["title"],
              style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(15)),
              width: ScreenAdapter.width(100),
              height: ScreenAdapter.height(4),
              color: controller.selectedTapIndex == e["id"]
                  ? Colors.red
                  : Colors.transparent,
            )
          ],
        ),
      );
    }).toList();
    subTitles.addAll(mainTitles);
    subTitles.addAll([_sizeBoxWidget()]);
    return Container(
        alignment: Alignment.center,
        // color: Colors.red,
        // width: ScreenAdapter.width(400),
        height: ScreenAdapter.height(96),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: subTitles));
  }

  Widget _sizeBoxWidget() {
    return Container(width: ScreenAdapter.width(55));
  }

//购物选项
  showBottomArrt() {
    Get.bottomSheet(GetBuilder<ProductContentController>(
      init: controller,
      builder: (controller) {
        return showBottomArrt2();
      },
    ));
  }

//购物选项2
  showBottomArrt2() {
    print(controller.bottomSheetAction);
    return Container(
      color: Colors.white,
      child: Stack(children: [
        ListView(padding: EdgeInsets.all(ScreenAdapter.width(20)), children: [
          ...controller.pContent.value.attr!.map((v) {
            return Wrap(
              children: [
                Container(
                  width: ScreenAdapter.kscreenWidth(),
                  child: Text(
                    "${v.cate}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  child: Wrap(
                    children: v.attrList!.map((v2) {
                      return InkWell(
                        onTap: () {
                          print(v.cate);
                          print(v2["title"]);
                          controller.changeAttr(v.cate!, v2["title"]);
                        },
                        child: Container(
                            padding: EdgeInsets.all(ScreenAdapter.width(20)),
                            child: Chip(
                              backgroundColor: v2["checked"] == true
                                  ? Colors.red
                                  : Colors.black12,
                              label: Text("${v2["title"]}"),
                            )),
                      );
                    }).toList(),
                  ),
                )
              ],
            );
          }).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "数量",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(50),
                    fontWeight: FontWeight.bold),
              ),
              CartItemNumView(),
            ],
          )
        ]),
        Positioned(
            top: 0,
            right: 2,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close))),
        Positioned(
            right: 0,
            left: 0,
            bottom: 10,
            child: Container(
              height: ScreenAdapter.height(200),
              padding: EdgeInsets.all(ScreenAdapter.width(30)),
              child: controller.bottomSheetAction == 1
                  ? _bottom2btn(false)
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                              // CircleBorder()
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () {
                        if (controller.bottomSheetAction == 2) {
                          controller.addCart();
                          // controller.buy();
                        }
                        if (controller.bottomSheetAction == 3) {
                          controller.buy();
                        }
                      },
                      child: Text("确定")),
            ))
      ]),
    );
  }
}
