import 'package:get/get.dart';

import '../controllers/one_step_login_controller.dart';

class OneStepLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OneStepLoginController>(
      () => OneStepLoginController(),
    );
  }
}
