import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
// import 'package:getxclidemo01/app/services/screenAdapter.dart';
import 'package:getxclidemo01/app/widget/login.dart';
import 'package:getxclidemo01/app/widget/passBtn.dart';
import 'package:getxclidemo01/app/widget/passTextField.dart';
import 'package:getxclidemo01/app/widget/userAgreement.dart';

import '../controllers/code_login_step_one_controller.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController> {
  const CodeLoginStepOneView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [TextButton(onPressed: () {}, child: Text("帮助"))],
        ),
        body: ListView(
          children: [
            Logo(),
            PassTextField(
              controller: controller.editingController,
              hintText: "请输入手机号",
              onChanged: (value) {
                print(value);
              },
            ),
            UserAgreement(),
            PassButton(
              btnText: "获取验证码",
              onPressed: () async {
                MessageModel model = await controller.sendLoginCode();
                if (model.success) {
                  Get.offAndToNamed("/code-login-step-two",
                      arguments: {"tel": controller.editingController.text});
                } else {
                  Get.snackbar("提示", model.message);
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed("/register-step-one");
                    },
                    child: Text("注册账号")),
                TextButton(
                    onPressed: () {
                      Get.offAndToNamed("/pass-word-login");
                    },
                    child: Text("其他登录方式")),
              ],
            )
          ],
        ));
  }
}
