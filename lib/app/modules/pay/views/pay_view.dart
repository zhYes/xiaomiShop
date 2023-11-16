import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/widget/passBtn.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('支付'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ListView(
          padding: EdgeInsets.all(ScreenAdapter.width(30)),
          children: [
            Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.payList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black12))),
                      padding: EdgeInsets.only(
                          top: ScreenAdapter.width(20),
                          bottom: ScreenAdapter.width(20)),
                      child: ListTile(
                        onTap: () {
                          controller.changePayList(index);
                        },
                        leading:
                            Image.network(controller.payList[index]["image"]),
                        title: Text("${controller.payList[index]["title"]}"),
                        trailing: Icon(
                          Icons.check,
                          color: controller.payList[index]["checked"]
                              ? Colors.red
                              : Colors.transparent,
                        ),
                      ),
                    );
                  },
                )),
            PassButton(
                btnText: "去支付",
                onPressed: () {
                  Get.offAllNamed("/tabs");
                  Get.snackbar("支付成功", "感谢使用");
                })
          ],
        ));
  }
}
