import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/routes/app_pages.dart';
// import 'package:getxclidemo01/app/routes/app_pages.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBarInit(), body: _mainPage());
  }

  Widget _mainPage() {
    return Row(
      children: [
        _leftCategory(controller),
        _rightCategory(controller),
      ],
    );
  }

  //appbar初始化
  _appBarInit() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message,
              color: Colors.black,
            ))
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      title: InkWell(
        onTap: () {
          Get.toNamed(Routes.SEARCHS);
        },
        child: Container(
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
                    color: Colors.black26,
                    fontSize: ScreenAdapter.fontSize(32)),
              )
            ],
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}

///左侧一级分类
Widget _leftCategory(CategoryController controller) {
  return Container(
    height: double.infinity,
    width: ScreenAdapter.width(280),
    color: Colors.black12,
    child: Obx(() => ListView.builder(
          itemCount: controller.leftCategoryList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller.changeSelectedIndex(index);
              },
              child: SizedBox(
                height: ScreenAdapter.height(140),
                child: Obx(() => Stack(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: ScreenAdapter.width(10),
                          height: ScreenAdapter.width(86),
                          color: controller.selectedIndex.value == index
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      ),
                      Center(
                        child: Text(
                          controller.leftCategoryList[index].title!,
                          style: TextStyle(
                              fontWeight:
                                  controller.selectedIndex.value == index
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                        ),
                      ),
                    ])),
              ),
            );
          },
        )),
  );
}

//右侧二级分类
Widget _rightCategory(CategoryController controller) {
  return Expanded(
      child: Container(
          height: double.infinity,
          margin: EdgeInsets.only(
              left: ScreenAdapter.width(60), right: ScreenAdapter.width(60)),
          child: Obx(() => GridView.builder(
                itemCount: controller.rightCategoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: ScreenAdapter.width(40),
                  mainAxisSpacing: ScreenAdapter.width(40),
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  var url =
                      "${NetWorkTool.domain}${controller.rightCategoryList[index].pic}";

                  return InkWell(
                    onTap: () {
                      // Get.toNamed(Routes.PRODUCT_LIST);
                      Get.toNamed("/product-list", arguments: {
                        "cid": "${controller.rightCategoryList[index].sId}"
                      });
                      print(url);
                    },
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Image.network(
                            url,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Text(controller.rightCategoryList[index].title!),
                      ],
                    ),
                  );
                },
              ))));
}
