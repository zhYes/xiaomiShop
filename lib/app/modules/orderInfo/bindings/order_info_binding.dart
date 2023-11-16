import 'package:get/get.dart';

import '../controllers/order_info_controller.dart';

class OrderInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderInfoController>(
      () => OrderInfoController(),
    );
  }
}
