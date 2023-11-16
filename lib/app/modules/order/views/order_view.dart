import 'package:flutter/material.dart';
//  https://www.itying.com/images/shouji.png
import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/networktool.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的订单'),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        body: Obx(() => controller.orderList.length != 0
            ? Stack(
                children: [
                  ListView(
                      padding: EdgeInsets.only(
                          left: ScreenAdapter.width(22),
                          top: ScreenAdapter.height(150),
                          right: ScreenAdapter.width(22)),
                      children: controller.orderList
                          .map((Value) => Card(
                                elevation: 0,
                                shadowColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            ScreenAdapter.height(55))),
                                    side: BorderSide(color: Colors.yellow)),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    Get.toNamed("order-info");
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: Text(
                                            "订单编号: ${Value.orderId}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        ...Value.orderItem!
                                            .map(
                                              (v) => Container(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        ScreenAdapter.height(
                                                            33)),
                                                child: ListTile(
                                                  leading: Container(
                                                    child: Image.network(
                                                      NetWorkTool().replaceUrl(
                                                          "${v.productImg}"),
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                  title:
                                                      Text("${v.productTitle}"),
                                                  trailing: Text(
                                                      "x ${v.productCount}"),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        ListTile(
                                          leading: Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                              Text("合计: "),
                                              Text(
                                                "¥${Value.allPrice}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize:
                                                        ScreenAdapter.fontSize(
                                                            44)),
                                              )
                                            ],
                                          ),
                                          trailing: ElevatedButton(
                                              onPressed: () {},
                                              child: Text(
                                                "申请售后",
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList()),
                  Positioned(
                      child: Container(
                    color: Colors.grey[100],
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "全部",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "待支付",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "待收货",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "已完成",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "已取消",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            : Center(
                child: Text("您还没有订单数据"),
              )));
  }
}
