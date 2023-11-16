import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/user/views/user_view.dart';
import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../../category/views/category_view.dart';
import '../../service/views/service_view.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController

  RxInt currentIndex = 0.obs;
  PageController pageController = Get.arguments == null
      ? PageController(initialPage: 0)
      : PageController(initialPage: Get.arguments["initialPage"]);
  final List<Widget> pages = [
    const HomeView(),
    const CategoryView(),
    const ServiceView(),
    CartView(),
    const UserView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    //用户默认加载的控制器选项
    if (Get.arguments != null) {
      currentIndex.value = Get.arguments["initialPage"];
      pageController =
          PageController(initialPage: Get.arguments["initialPage"]);
    }
  }

  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }
}
