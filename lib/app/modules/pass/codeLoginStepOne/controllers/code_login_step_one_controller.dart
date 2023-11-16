import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/services/networktool.dart';

class CodeLoginStepOneController extends GetxController {
  //TODO: Implement CodeLoginStepOneController
  final TextEditingController editingController = TextEditingController();
  final NetWorkTool netWorkTool = NetWorkTool();
  @override
  void onInit() {
    print("oninitaaaaaa111");
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

//发送验证码
  Future<MessageModel> sendLoginCode() async {
    var result = await netWorkTool
        .post("api/sendLoginCode", data: {"tel": editingController.text});
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
