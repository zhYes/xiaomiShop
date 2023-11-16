import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/modules/user/controllers/user_controller.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/snack.dart';
import 'package:getxclidemo01/app/services/storage.dart';

class CodeLoginStepTwoController extends GetxController {
  //TODO: Implement CodeLoginStepTwoController
  final UserController userController = Get.find<UserController>();
  final NetWorkTool netWorkTool = NetWorkTool();
  final TextEditingController editingController = TextEditingController();
  final tel = Get.arguments["tel"];
  RxInt lessTime = 10.obs;
  @override
  void onInit() {
    super.onInit();
    countDown();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    userController.getUserInfo();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  //完成注册接口
  Future<MessageModel> doLogin() async {
    var result = await netWorkTool.post("api/validateLoginCode", data: {
      "tel": tel,
      "code": editingController.text,
    });
    if (result != null) {
      if (result.data["success"]) {
        // Get.snackbar("", "登录成功");
        const SnackMe();
        //执行登录 保存用户信息
        Storage.setData("userinfo", result.data["userinfo"]);
        print("$result, 这是验证码登录6666的数据");
        //这是返回注册成功的提示
        return MessageModel(message: "登录成功", success: true);
      }
      return MessageModel(message: result.data["message"], success: false);
    }
    return MessageModel(message: "网络异常", success: false);
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
    var result =
        await netWorkTool.post("api/sendLoginCode", data: {"tel": tel});
    if (result != null) {
      print(result);
      if (result.data["success"]) {
        // Get.snackbar("", "发送成功");
        lessTime.value = 10;
        countDown();
        Clipboard.setData(ClipboardData(text: result.data["code"]));
        // Get.snackbar("短信", "验证码:${result.data["code"]}");
        return true;
      }
      return false;
    }
    return false;
  }
}
