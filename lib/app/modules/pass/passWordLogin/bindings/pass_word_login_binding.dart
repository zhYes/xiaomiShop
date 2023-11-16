import 'package:get/get.dart';

import '../controllers/pass_word_login_controller.dart';

class PassWordLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassWordLoginController>(
      () => PassWordLoginController(),
    );
  }
}
