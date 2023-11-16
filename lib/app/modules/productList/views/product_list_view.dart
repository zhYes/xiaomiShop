import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getxclidemo01/app/services/networktool.dart';

import '../controllers/product_list_controller.dart';

import '../../../services/screenAdapter.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      endDrawer: Drawer(
          width: 200,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Text(
                "44455解决",
                style: TextStyle(fontSize: 33),
              );
            },
            itemCount: 33,
          )),
      key: controller.scaffoldGlobalKey,
      appBar: _appBarInit(),
      body: Stack(
        children: [_productListBody(), _bodyHeader()],
      ),
      backgroundColor: const Color.fromRGBO(234, 220, 220, 1),
    );
  }

//没有更多加载提示器
  Widget notice() {
    if (controller.hasData.value) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const Center(
        child: Text("没有更多数据了,我是有底线的哦~"),
      );
    }
  }

//顶部选项
  _bodyHeader() {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Obx(() => Container(
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                  width: ScreenAdapter.height(2),
                  color: const Color.fromARGB(51, 0, 0, 0),
                )),
                color: const Color.fromRGBO(234, 220, 220, 1),
              ),
              height: ScreenAdapter.height(120),
              width: ScreenAdapter.kscreenWidth(),
              child: Row(
                  children: controller.subHearderList.map((e) {
                return Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      controller.changeSubTitle(e["id"]);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(e["title"],
                            style: TextStyle(
                                color: controller.selectedSubTitle == e["id"]
                                    ? Colors.red
                                    : Colors.black,
                                fontSize: ScreenAdapter.fontSize(32)),
                            textAlign: TextAlign.center),
                        arrowIcon(e["id"])
                      ],
                    ),
                  ),
                );
              }).toList()),
            )));
  }

  Widget arrowIcon(selectedId) {
    if (selectedId == 2 ||
        selectedId == 3 ||
        controller.arrowRefresh.value == 1 ||
        controller.arrowRefresh.value == -1) {
      if (controller.subHearderList[selectedId - 1]["sort"] == 1) {
        return Icon(Icons.arrow_drop_down);
      } else {
        return Icon(Icons.arrow_drop_up);
      }
    } else {
      return Text("");
    }
  }

//商品列表
  _productListBody() {
    return Obx(() => controller.productList.isNotEmpty
        ? ListView.builder(
            itemCount: controller.productList.length,
            controller: controller.scrollController,
            padding: EdgeInsets.only(
                top: ScreenAdapter.height(120),
                bottom: ScreenAdapter.height(60)),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(ScreenAdapter.width(20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(60)),
                          width: ScreenAdapter.width(400),
                          // height: ScreenAdapter.width(460),
                          child: Image.network(
                            "${NetWorkTool.domain}${controller.productList[index].pic}",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.productList[index].title}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenAdapter.fontSize(42)),
                            ),
                            Text(
                              "${controller.productList[index].subTitle}${controller.productList[index].subTitle}${controller.productList[index].subTitle}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(34)),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: ScreenAdapter.width(20)),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "CPU",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                ScreenAdapter.fontSize(34)),
                                      ),
                                      Text(
                                        "独一无二",
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34)),
                                      ),
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "内存空间",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                ScreenAdapter.fontSize(34)),
                                      ),
                                      Text(
                                        "512超大内存空间",
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34)),
                                      ),
                                    ],
                                  )),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        "核心",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                ScreenAdapter.fontSize(34)),
                                      ),
                                      Text(
                                        "独立4核心",
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(34)),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                            Text(
                              "¥ ${controller.productList[index].price} 起",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenAdapter.fontSize(42)),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  controller.productList.length - 1 == index
                      ? notice()
                      : const SizedBox(
                          height: 0,
                        ),
                ],
              );
            },
          )
        : notice());
  }

//appbar初始化
  _appBarInit() {
    return AppBar(
      actions: [Text("")],
      backgroundColor: const Color.fromRGBO(234, 220, 220, 1),
      elevation: 0,
      title: Container(
        width: 860,
        height: ScreenAdapter.height(96),
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenAdapter.width(34)),
              child: const Icon(
                Icons.search,
                color: Colors.black12,
              ),
            ),
            Text(
              "手机",
              style: TextStyle(
                  color: Colors.black26, fontSize: ScreenAdapter.fontSize(32)),
            )
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
