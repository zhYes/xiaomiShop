import 'package:get/get.dart';

import '../controllers/searchs_controller.dart';

class SearchsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchsController>(
      () => SearchsController(),
    );
  }
}
