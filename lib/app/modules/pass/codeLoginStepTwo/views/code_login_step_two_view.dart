import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/message.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';
import 'package:getxclidemo01/app/widget/login.dart';
import 'package:getxclidemo01/app/widget/passBtn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/code_login_step_two_controller.dart';

class CodeLoginStepTwoView extends GetView<CodeLoginStepTwoController> {
  const CodeLoginStepTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('输入验证码登录'),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.all(ScreenAdapter.width(40)),
          children: [
            Logo(),
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(88)),
              child: PinCodeTextField(
                autoFocus: true,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                appContext: context,
                length: 6,
                controller: controller.editingController,
                onCompleted: (value) async {
                  MessageModel model = await controller.doLogin();
                  if (model.success) {
                    // Get.offAllNamed("/tabs", arguments: {"initialPage": 0});

                    Get.back();
                    Get.snackbar("", "登录成功");
                    print("成功!!");
                  } else {
                    Get.snackbar("提示", model.message);
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => controller.lessTime.value > 0
                    ? TextButton(
                        onPressed: () {},
                        child: Text("${controller.lessTime}秒后重新发送"))
                    : TextButton(
                        onPressed: () {
                          controller.sendCode();
                        },
                        child: Text("重新获取验证码"))),
                TextButton(onPressed: () {}, child: Text("帮助")),
              ],
            ),
            PassButton(
                btnText: "验证验证码",
                onPressed: () async {
                  MessageModel model = await controller.doLogin();
                  if (model.success) {
                    // Get.offAllNamed("/tabs", arguments: {"initialPage": 0});
                    Get.back();
                    print("成功!!");
                    Get.snackbar("", "登录成功");
                  } else {
                    Get.snackbar("提示", model.message);
                  }
                })
          ],
        ));
  }
}
