import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/cart/controllers/cart_controller.dart';

import 'package:getxclidemo01/app/services/screenAdapter.dart';

class CartItemNumView extends GetView {
  final CartController controller = Get.find();
  final Map cartItem;
  CartItemNumView(this.cartItem, {Key? key}) : super(key: key);

  _left() {
    return InkWell(
      onTap: () {
        controller.decCartNum(cartItem);
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
        controller.incCartNum(cartItem);
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
      child: Text("${cartItem["count"]}"),
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
