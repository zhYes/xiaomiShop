import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/widget/login.dart';
import 'package:getxclidemo01/app/widget/passBtn.dart';
import 'package:getxclidemo01/app/widget/passTextField.dart';
import 'package:getxclidemo01/app/widget/userAgreement.dart';

import '../controllers/pass_word_login_controller.dart';

class PassWordLoginView extends GetView<PassWordLoginController> {
  const PassWordLoginView({Key? key}) : super(key: key);
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
              hintText: "小米账号/手机号/邮箱",
              onChanged: (Value) {},
              controller: controller.telController,
            ),
            PassTextField(
              hintText: "密码",
              onChanged: (Value) {},
              controller: controller.passController,
            ),
            UserAgreement(),
            PassButton(
                btnText: "登录",
                onPressed: () async {
                  MessageModel model = await controller.doPassLogin();
                  if (model.success) {
                    Get.back();
                    Get.snackbar("提示", "登录成功");
                    // Get.offAllNamed("/tabs", arguments: {"initialPage": 0});
                  } else {
                    Get.snackbar("提示", "${model.message}");
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("忘记密码")),
                TextButton(onPressed: () {}, child: Text("其他登录方式")),
              ],
            )
          ],
        ));
  }
}
