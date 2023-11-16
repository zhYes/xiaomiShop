import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/cart/controllers/cart_controller.dart';
import 'package:getxclidemo01/app/modules/cart/views/cart_item_num_view.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

class CartItemViewView extends GetView {
  @override
  final CartController controller = Get.find();
  final Map carItem;
  CartItemViewView(this.carItem, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  width: ScreenAdapter.height(2), color: Colors.black12))),
      padding: EdgeInsets.all(ScreenAdapter.width(20)),
      child: Row(
        children: [
          Container(
            width: ScreenAdapter.width(100),
            child: Checkbox(
              activeColor: Colors.red,
              value: carItem["checked"],
              onChanged: (v) {
                controller.checkCartItem(carItem);
                print(v);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(ScreenAdapter.height(24)),
            margin: EdgeInsets.only(right: ScreenAdapter.width(33)),
            width: ScreenAdapter.width(260),
            child: Container(
              alignment: Alignment.center,
              width: ScreenAdapter.width(260),
              child: Image.network(
                NetWorkTool().replaceUrl("${carItem["pic"]}"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${carItem["title"]}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(36),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenAdapter.height(22),
              ),
              Row(
                children: [
                  Chip(label: Text("${carItem["selectedAttr"]}")),
                ],
              ),
              SizedBox(
                  // height: ScreenAdapter.height(22),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¥${carItem["price"]}",
                    style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(33),
                        color: Colors.red),
                  ),
                  CartItemNumView(carItem),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
