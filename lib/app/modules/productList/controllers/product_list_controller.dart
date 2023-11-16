import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/selling_sub_model.dart';
import 'package:getxclidemo01/app/services/networktool.dart';

class ProductListController extends GetxController {
  //TODO: Implement ProductListController

//商品列表数据
  RxList<SellingSubItemModel> productList = <SellingSubItemModel>[].obs;
  //滚动监听
  ScrollController scrollController = ScrollController();
  //数据是否还有
  RxBool hasData = true.obs;
  //侧边栏
  GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();
  //选中的id
  RxInt selectedSubTitle = 1.obs;
  //进行箭头的刷新
  RxInt arrowRefresh = 1.obs;
  //获取的参数
  String? cid = Get.arguments["cid"];
  String? keyWords = Get.arguments["keyWords"];

  String uri = "";
  int page = 1;
  int pageSize = 5;
  bool flag = true;
  String sort = "";
  List subHearderList = [
    {"id": 1, "title": "综合", "filter": "all", "sort": -1},
    {"id": 2, "title": "销量", "filter": "selecount", "sort": -1},
    {"id": 3, "title": "价格", "filter": "price", "sort": -1},
    {"id": 4, "title": "筛选", "filter": "filter", "sort": -1},
  ];

  changeSubTitle(selectedId) {
    if (selectedId == 4) {
      scaffoldGlobalKey.currentState!.openEndDrawer();
    } else if (selectedId == 2 || selectedId == 3) {
      sort =
          "${subHearderList[selectedId - 1]["filter"]}_${subHearderList[selectedId - 1]["sort"]}";
      subHearderList[selectedId - 1]["sort"] *= -1;
      hasData.value = true;
      page = 1;
      scrollController.jumpTo(0);
      productList.value = [];
      arrowRefresh.value = arrowRefresh.value * -1;
      getProductListData();
    }
    selectedSubTitle.value = selectedId;
  }

  @override
  void onInit() {
    super.onInit();
    cid = Get.arguments["cid"];
    getProductListData();
    _scrollController();
  }

  @override
  void onClose() {
    super.onClose();
  }

  _scrollController() {
    scrollController.addListener(() {
      if (scrollController.position.pixels + 20 >
          scrollController.position.maxScrollExtent) {
        getProductListData();
      }
    });
  }

  getProductListData() async {
    if (flag && hasData.value) {
      if (cid != null) {
        uri = "api/plist?cid=$cid&page=$page&pageSize=$pageSize&sort=$sort";
      } else {
        uri =
            "api/plist?search=$keyWords&page=$page&pageSize=$pageSize&sort=$sort";
      }
      flag = false;
      var respons = await NetWorkTool().get(uri);
      print("uri == $uri");
      if (respons != null) {
        var temp = SellingSubModel.fromJson(respons.data).result!;
        productList += temp;
        // productList.addAll(temp);
        page++;
        update();
        flag = true;
        if (temp.length < pageSize) {
          hasData.value = false;
        }
      }
    }
  }
}
