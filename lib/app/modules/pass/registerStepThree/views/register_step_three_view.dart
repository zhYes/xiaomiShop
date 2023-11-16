import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/widget/login.dart';
import 'package:getxclidemo01/app/widget/passBtn.dart';
import 'package:getxclidemo01/app/widget/passTextField.dart';

import '../controllers/register_step_three_controller.dart';

class RegisterStepThreeView extends GetView<RegisterStepThreeController> {
  const RegisterStepThreeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册3设置密码'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Logo(),
          PassTextField(
              hintText: "输入密码",
              onChanged: (value) {},
              controller: controller.editingController1),
          PassTextField(
              hintText: "确认密码",
              onChanged: (value) {},
              controller: controller.editingController2),
          PassButton(
              btnText: "提交注册",
              onPressed: () async {
                MessageModel model = await controller.doRegister();
                if (model.success) {
                  Get.snackbar("", "注册成功");
                  Get.offAllNamed("/tabs", arguments: {"initialPage": 4});
                } else {
                  Get.snackbar("", model.message);
                }
              })
        ],
      ),
    );
  }
}
