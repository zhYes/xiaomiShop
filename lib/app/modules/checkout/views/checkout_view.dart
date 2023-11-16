import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  Widget checkoutItem(catItemValue) {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenAdapter.height(20),
          right: ScreenAdapter.height(30),
          bottom: ScreenAdapter.height(20)),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            width: ScreenAdapter.width(200),
            height: ScreenAdapter.width(200),
            child: Image.network(
              NetWorkTool().replaceUrl("${catItemValue["pic"]}"),
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${catItemValue["title"]}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenAdapter.height(10),
              ),
              Text(
                "${catItemValue["selectedAttr"]}",
              ),
              SizedBox(
                height: ScreenAdapter.height(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¥${catItemValue["price"]}",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "x${catItemValue["count"]}",
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("确认订单"),
          centerTitle: true,
        ),
        body: Stack(
          children: [_body(), _bottomPostion()],
        ));
  }

  _body() {
    return ListView(
      padding: EdgeInsets.only(
          left: ScreenAdapter.width(40),
          right: ScreenAdapter.width(40),
          top: ScreenAdapter.width(40),
          bottom: ScreenAdapter.width(300)),
      children: [
        Obx(() => controller.addressList.isEmpty
            ? Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(ScreenAdapter.width(20))),
                child: ListTile(
                  onTap: () {
                    Get.toNamed("/address-list");
                  },
                  leading: const Icon(Icons.add_location),
                  title: const Text("增加收货地址"),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(ScreenAdapter.width(20))),
                child: ListTile(
                  onTap: () {
                    Get.toNamed("/address-list");
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${controller.addressList[0].name} ${controller.addressList[0].phone}"),
                      SizedBox(height: ScreenAdapter.height(10)),
                      Text("${controller.addressList[0].address}"),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              )),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: Obx(() => Column(
                children: controller.checkoutLists
                    .map((catItemValue) => checkoutItem(catItemValue))
                    .toList(),
              )),
        ),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
            child: Column(
              children: [
                ListTile(
                  title: Text("运费"),
                  trailing: Text("包邮"),
                ),
                ListTile(
                    title: Text("优惠券"),
                    trailing: Wrap(
                      children: [Text("无可用"), Icon(Icons.navigate_next)],
                    )),
                ListTile(
                    title: Text("卡券"),
                    trailing: Wrap(
                      children: [Text("无可用"), Icon(Icons.navigate_next)],
                    )),
              ],
            )),
        SizedBox(
          height: ScreenAdapter.height(40),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: ListTile(
            title: Text("发票"),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
      ],
    );
  }

  _bottomPostion() {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          padding: EdgeInsets.only(right: ScreenAdapter.width(20)),
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(190),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(178, 240, 236, 236),
                      width: ScreenAdapter.height(2))),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Row(
                    children: [
                      SizedBox(
                        width: ScreenAdapter.width(33),
                      ),
                      Text("共${controller.totalGoodsNum}件,合计:"),
                      Text(
                        "¥${controller.totalPrice}",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ScreenAdapter.fontSize(55)),
                      )
                    ],
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 165, 0, 0.9)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                          // CircleBorder()
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {
                    //判断是否登录
                    controller.doCheckout();
                  },
                  child: Text("去付款")),
            ],
          ),
        ));
  }
}
