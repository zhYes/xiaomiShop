import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/cart/views/cart_item_view_view.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

import '../controllers/cart_controller.dart';

// ignore: must_be_immutable
class CartView extends GetView {
  @override
  CartController controller = Get.put(CartController());
  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('购物车'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Obx(() => controller.isEditor.value
                ? TextButton(
                    onPressed: () {
                      controller.changeEditor();
                    },
                    child: Text("完成"))
                : TextButton(
                    onPressed: () {
                      controller.changeEditor();
                    },
                    child: Text("编辑")))
          ],
        ),
        body: GetBuilder<CartController>(
          init: controller,
          initState: (state) {
            controller.getCartListData();
          },
          builder: (controller) {
            return controller.cartList.isEmpty
                ? Center(child: Text("购物车空空的 ~"))
                : Stack(children: [
                    Container(
                        child: ListView.builder(
                      padding:
                          EdgeInsets.only(bottom: ScreenAdapter.height(200)),
                      itemCount: controller.cartList.length,
                      itemBuilder: (context, index) {
                        var value = controller.cartList[index];
                        return CartItemViewView(value);
                      },
                    )),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          padding:
                              EdgeInsets.only(right: ScreenAdapter.width(20)),
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
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.red,
                                      value: controller.checkBoxAll.value,
                                      onChanged: (value) {
                                        controller.checkedBoxAllFunc(value);
                                      }),
                                  const Text("全选")
                                ],
                              ),
                              Obx(() => !controller.isEditor.value
                                  ? Row(
                                      children: [
                                        Text("合计: "),
                                        Text("${controller.totalPrice.value}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(58),
                                                color: Colors.red)),
                                        SizedBox(
                                            width: ScreenAdapter.width(20)),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color.fromRGBO(
                                                            255, 165, 0, 0.9)),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                shape:
                                                    MaterialStateProperty.all(
                                                        // CircleBorder()
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                            onPressed: () {
                                              //判断是否登录
                                              // Get.toNamed("/checkout");
                                              controller.checkout();
                                            },
                                            child: Text("结算")),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        const Color.fromRGBO(
                                                            255, 165, 0, 0.9)),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                shape:
                                                    MaterialStateProperty.all(
                                                        // CircleBorder()
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                            onPressed: () {
                                              //判断是否登录
                                              // Get.toNamed("/checkout");
                                              controller.deleteCheckout();
                                            },
                                            child: Text("删除")),
                                      ],
                                    ))
                            ],
                          ),
                        ))
                  ]);
          },
        )

        // Obx(() => ),
        );
  }
}
