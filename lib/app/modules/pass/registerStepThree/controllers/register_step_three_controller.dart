import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/storage.dart';

class RegisterStepThreeController extends GetxController {
  //TODO: Implement RegisterStepThreeController
  final TextEditingController editingController1 = TextEditingController();
  final TextEditingController editingController2 = TextEditingController();
  final NetWorkTool netWorkTool = NetWorkTool();
  String tel = Get.arguments["tel"];
  String code = Get.arguments["code"];
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

//完成注册接口
  Future<MessageModel> doRegister() async {
    var result = await netWorkTool.post("api/register",
        data: {"tel": tel, "code": code, "password": editingController1.text});
    if (result != null) {
      if (result.data["success"]) {
        Get.snackbar("", "发送成功");
        //执行登录 保存用户信息
        Storage.setData("userinfo", result.data["userinfo"]);
        print("${result.data["userinfo"]}, === == == = 这是存储的数据");
        return MessageModel(message: "注册成功", success: true);
      }
      return MessageModel(message: result.data["message"], success: false);
    }
    return MessageModel(message: "网络异常", success: false);
  }
}
