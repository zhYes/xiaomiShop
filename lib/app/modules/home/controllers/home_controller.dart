import '../../../services/networktool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/selling_sub_model.dart';
import '../model/category_model.dart';
import '../model/home_swiper_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxBool flag = false.obs;
  final ScrollController scrollController = ScrollController();
  List pics = [
    "images/focus/focus01.png",
    "images/focus/focus02.png",
    "images/focus/focus01.png",
    "images/focus/focus02.png",
    "images/focus/focus01.png",
    "images/focus/focus02.png",
  ];
  //轮播数组
  RxList<SwiperItemModel> swiperList = <SwiperItemModel>[].obs;
  //热销臻选轮播数据
  RxList<SwiperItemModel> swiperSellingList = <SwiperItemModel>[].obs;
  //热销甄选右侧数据
  RxList<SellingSubItemModel> sellingSubList = <SellingSubItemModel>[].obs;
  //底部热销推荐数据
  RxList<SellingSubItemModel> sellingBottomList = <SellingSubItemModel>[].obs;
  //分类数组
  RxList<CategroyItem> categoryList = <CategroyItem>[].obs;
// {"url": "https://www.itying.com/images/focus/focus01.png"},
  // {"url": "https://www.itying.com/images/focus/focus02.png"},
  @override
  void onInit() {
    super.onInit();
    scrollControllerAddListener();
    getFocusData();
    getCategoryData();
    getSellingData();
    getSellingSubData();
    getSellingBotomListData();
  }

  scrollControllerAddListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10 && flag.value == false) {
        flag.value = true;
        update();
      }
      if (scrollController.position.pixels < 10 && flag.value == true) {
        flag.value = false;
        update();
      }
    });
  }

  ///获取首页轮播图
  getFocusData() async {
    var result = await NetWorkTool().get("api/focus");
    // print(result.data);
    swiperList.value = HomeSwiperModel.fromJson(result.data).result!;
    update();
  }

  ///获取热销臻选轮播图
  getSellingData() async {
    var result = await NetWorkTool().get("api/focus?position=2");
    // print(result.data);
    swiperSellingList.value = HomeSwiperModel.fromJson(result.data).result!;
    update();
  }

  ///获取首页分类
  getCategoryData() async {
    var result = await NetWorkTool().get("api/bestCate");
    // print(result.data);
    categoryList.value = CategoryModel.fromJson(result.data).result!;
    update();
  }

  ///获取热销臻选右侧
  getSellingSubData() async {
    var result = await NetWorkTool().get("api/plist?is_hot=1&pageSize=3");
    // print(result.data);
    sellingSubList.value = SellingSubModel.fromJson(result.data).result!;
    update();
  }

  ///获取底部列表数据
  getSellingBotomListData() async {
    var result = await NetWorkTool().get("api/plist?is_best=1");
    // print(result.data);
    sellingBottomList.value = SellingSubModel.fromJson(result.data).result!;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
