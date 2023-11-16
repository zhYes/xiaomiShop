import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';
import 'package:getxclidemo01/app/services/searchServices.dart';

import '../controllers/searchs_controller.dart';

class SearchsView extends GetView<SearchsController> {
  const SearchsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(234, 220, 220, 1),
        appBar: _appBarInit(),
        body: _searchBody());
  }

  _searchBody() {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.height(20)),
      child: ListView(
        children: [
          Obx(() => controller.historyList.isEmpty
              ? SizedBox(
                  height: 0,
                )
              : historyLine()),
          Obx(() => Container(
                padding: EdgeInsets.only(top: ScreenAdapter.height(22)),
                child: Wrap(
                    children: controller.historyList
                        .map(
                          (element) => GestureDetector(
                            onLongPress: () {
                              Get.defaultDialog(
                                title: "删除?",
                                middleText: "确定删除这条数据吗?",
                                confirm: ElevatedButton(
                                    onPressed: () {
                                      controller.removeItemHistory(element);
                                      Get.back();
                                    },
                                    child: Text("确定删除")),
                                cancel: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("取消")),
                              );
                            },
                            child: Container(
                              child: Text(element),
                              decoration: BoxDecoration(color: Colors.white),
                              padding: EdgeInsets.all(ScreenAdapter.height(20)),
                              margin: EdgeInsets.all(ScreenAdapter.width(20)),
                            ),
                          ),
                        )
                        .toList()),
              )),
          SizedBox(
            height: ScreenAdapter.height(33),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "猜你喜欢",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.refresh)
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenAdapter.height(22)),
            child: Wrap(
              children: [
                Container(
                  child: Text("手机"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("笔记本电脑"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("羽绒服"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("手机"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("笔记本电脑"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("羽绒服"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("手机"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("笔记本电脑"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
                Container(
                  child: Text("羽绒服"),
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(ScreenAdapter.height(20)),
                  margin: EdgeInsets.all(ScreenAdapter.width(20)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // decoration: BoxDecoration(color: Colors.red),
            child: Column(
              children: [
                Container(
                  height: ScreenAdapter.height(138),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage("assets/images/hot_search.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  child: GridView.builder(
                    itemCount: 20,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: ScreenAdapter.width(20),
                        mainAxisSpacing: ScreenAdapter.width(20),
                        childAspectRatio: 3 / 1),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: ScreenAdapter.width(120),
                            child: Image.network(
                                "${NetWorkTool.domain}public\\upload\\HYWKHxrKgE9O6zKajRTmb50B.png"),
                          ),
                          Expanded(
                            child: Container(
                                padding:
                                    EdgeInsets.all(ScreenAdapter.width(20)),
                                child: Text("推荐这个手机性能提别好")),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

/* 搜索历史的文字行 */
  Widget historyLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "搜索历史",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: () {
              Get.bottomSheet(Container(
                width: ScreenAdapter.kscreenWidth(),
                height: ScreenAdapter.height(360),
                color: Colors.white,
                child: Column(
                  children: [
                    Text("确定要删除历史记录吗"),
                    SizedBox(height: ScreenAdapter.height(44)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("取消")),
                        ElevatedButton(
                          onPressed: () {
                            controller.clearBaseHistoryList();
                            Get.back();
                          },
                          child: Text("确定"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.red),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                        ),
                      ],
                    )
                  ],
                ),
              ));
            },
            icon: Icon(Icons.delete_forever_outlined))
      ],
    );
  }

//appbar初始化
  _appBarInit() {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              if (controller.keyWords.isEmpty) {
                return;
              }
              Get.toNamed("/product-list",
                  arguments: {"keyWords": controller.keyWords});

              SearchServices.setHistoryData(controller.keyWords);

              controller.historyList.add(controller.keyWords);
            },
            child: const Text(
              "搜索",
              style: TextStyle(color: Colors.black),
            ))
      ],
      backgroundColor: Color.fromRGBO(234, 220, 220, 1),
      elevation: 0,
      title: Container(
          width: 860,
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(30)),
          child: TextField(
            onChanged: (value) {
              controller.keyWords = value;
              print(value);
            },
            autofocus: true,
            style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none)),
          )),
      centerTitle: true,
    );
  }
}
