import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/services/networktool.dart';

class RegisterStepOneController extends GetxController {
  //TODO: Implement RegisterStepOneController

  final TextEditingController editingController = TextEditingController();
  NetWorkTool netWorkTool = NetWorkTool();
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
    super.onClose();
  }

//发送验证码
  Future<MessageModel> sendCode() async {
    var result = await netWorkTool
        .post("api/sendCode", data: {"tel": editingController.text});
    if (result != null) {
      print(result);
      if (result.data["success"]) {
        Get.snackbar("短信", "验证码:${result.data["code"]}");
        return MessageModel(message: "发送成功", success: true);
      }
      return MessageModel(message: result.data["message"], success: false);
    }
    return MessageModel(message: result.data["网络异常"], success: false);
  }
}
