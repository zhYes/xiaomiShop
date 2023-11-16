import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/user_model.dart';
import 'package:getxclidemo01/app/services/storage.dart';
import 'package:getxclidemo01/app/services/userService.dart';

class UserController extends GetxController {
  //TODO: Implement UserController

  RxBool isLogin = false.obs;
  // RxList userList = [].obs;
  var userInfo = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserInfo() async {
    var tempLoginState = await UserService.getUserInfoLoginState();
    isLogin.value = tempLoginState;

    var temp = await UserService.getUserInfo();
    if (temp.isNotEmpty) {
      userInfo.value = UserModel.fromJson(temp[0]);
    }
    update();
  }

  loginOut() {
    Storage.clear("userinfo");
    isLogin.value = false;
    userInfo.value = UserModel();
    Get.snackbar("提示", "退出登录成功");
  }
}
