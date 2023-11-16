import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

class CartItemNumView extends GetView {
  CartItemNumView({Key? key}) : super(key: key);

  @override
  final ProductContentController controller = Get.find();
  _left() {
    return InkWell(
      onTap: () {
        controller.decBuyNum();
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(100),
        child: Text("-"),
      ),
    );
  }

  _right() {
    return InkWell(
      onTap: () {
        controller.incBuyNum();
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(60),
        child: Text("+"),
      ),
    );
  }

  _center() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                  width: ScreenAdapter.height(2), color: Colors.black12),
              right: BorderSide(
                  width: ScreenAdapter.height(2), color: Colors.black12))),
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(60),
      child: Obx(() => Text("${controller.buyNum.value}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(244),
      decoration: BoxDecoration(
          border: Border.all(
        width: ScreenAdapter.height(2),
        color: Colors.black12,
      )),
      child: Row(
        children: [
          _left(),
          _center(),
          _right(),
        ],
      ),
    );
  }
}
