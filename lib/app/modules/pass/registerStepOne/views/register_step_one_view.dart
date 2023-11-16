import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/widget/login.dart';
import 'package:getxclidemo01/app/widget/passBtn.dart';
import 'package:getxclidemo01/app/widget/passTextField.dart';
import 'package:getxclidemo01/app/widget/userAgreement.dart';

import '../controllers/register_step_one_controller.dart';

class RegisterStepOneView extends GetView<RegisterStepOneController> {
  const RegisterStepOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('注册'),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Logo(),
            PassTextField(
              hintText: "请输入手机号",
              onChanged: (Value) {},
              controller: controller.editingController,
            ),
            // PassTextField(hintText: "密码", onChanged: (Value) {}),
            UserAgreement(),
            PassButton(
                btnText: "下一步",
                onPressed: () async {
                  if (GetUtils.isPhoneNumber(
                          controller.editingController.text) &&
                      controller.editingController.text.length == 11) {
                    MessageModel model = await controller.sendCode();
                    if (model.success) {
                      Get.toNamed("/register-step-two",
                          arguments: controller.editingController.text);
                    } else {
                      Get.snackbar("提示", model.message);
                    }
                  } else {
                    Get.snackbar("提示", "手机号格式不正确");
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("获取帮助")),
                TextButton(onPressed: () {}, child: Text("其他登录方式")),
              ],
            )
          ],
        ));
  }
}
