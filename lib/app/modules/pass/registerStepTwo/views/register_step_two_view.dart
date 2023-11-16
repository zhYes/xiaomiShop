import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../widget/login.dart';
import '../../../../widget/passBtn.dart';
import '../controllers/register_step_two_controller.dart';

class RegisterStepTwoView extends GetView<RegisterStepTwoController> {
  const RegisterStepTwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('手机号快速注册2'),
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => controller.lessTime.value > 0
                    ? TextButton(
                        onPressed: () {},
                        child: Text("${controller.lessTime.value}s后重新发送"))
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
                  print(controller.editingController.text);
                  bool flag = await controller.validateCode();
                  if (flag) {
                    Get.snackbar("", "验证通过");
                    Get.toNamed("/register-step-three", arguments: {
                      "tel": controller.tel,
                      "code": controller.editingController.text
                    });
                  } else {
                    Get.snackbar("", "验证失败");
                  }
                })
          ],
        ));
  }
}
