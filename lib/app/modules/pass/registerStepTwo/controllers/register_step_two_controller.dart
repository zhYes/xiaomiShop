import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/networktool.dart';

class RegisterStepTwoController extends GetxController {
  //TODO: Implement RegisterStepTwoController
  final TextEditingController editingController = TextEditingController();
  final NetWorkTool netWorkTool = NetWorkTool();
  String tel = Get.arguments;
  RxInt lessTime = 10.obs;
  @override
  void onInit() {
    super.onInit();
    countDown();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

//验证验证码
  Future<bool> validateCode() async {
    var result = await netWorkTool.post("api/validateCode",
        data: {"tel": tel, "code": editingController.text});
    if (result != null) {
      print(result);
      if (result.data["success"]) {
        return true;
      }
      return false;
    } else {
      return false;
    }
  }

//倒计时
  countDown() {
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      lessTime.value--;
      if (lessTime.value == 0) {
        timer.cancel();
      }
    });
    update();
  }

//重新发送验证码
  Future<bool> sendCode() async {
    var result = await netWorkTool.post("api/sendCode", data: {"tel": tel});
    if (result != null) {
      print(result);
      if (result.data["success"]) {
        Get.snackbar("", "发送成功");
        lessTime.value = 10;
        countDown();
        Clipboard.setData(ClipboardData(text: result.data["code"]));
        Get.snackbar("短信", "验证码:${result.data["code"]}");
        return true;
      }
      return false;
    }
    return false;
  }
}
