import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/modules/user/controllers/user_controller.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/storage.dart';

class PassWordLoginController extends GetxController {
  //TODO: Implement PassWordLoginController

  final NetWorkTool netWorkTool = NetWorkTool();
  final UserController userController = Get.find<UserController>();
  final TextEditingController telController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    userController.getUserInfo();
    super.onClose();
  }

  //发送验证码
  Future<MessageModel> doPassLogin() async {
    var result = await netWorkTool.post("api/doLogin", data: {
      "username": telController.text,
      "password": passController.text
    });
    if (result != null) {
      print(result);
      if (result.data["success"]) {
        Storage.setData("userinfo", result.data["userinfo"]);
        return MessageModel(message: "登录成功", success: true);
      }
      return MessageModel(message: result.data["message"], success: false);
    }
    return MessageModel(message: result.data["网络异常"], success: false);
  }
}
