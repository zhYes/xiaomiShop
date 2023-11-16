import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/screenAdapter.dart';
import '../controllers/order_info_controller.dart';

class OrderInfoView extends GetView<OrderInfoController> {
  const OrderInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('订单详情'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[200],
        ),
        body: ListView(
          padding: EdgeInsets.all(ScreenAdapter.height(44)),
          children: [
            Container(
              child: ListTile(
                title: Text(
                  "商品信息",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            checkoutItem(),
            //订单信息
            SizedBox(height: ScreenAdapter.height(40)),
            Container(
              padding: EdgeInsets.only(
                  top: ScreenAdapter.height(20),
                  bottom: ScreenAdapter.height(20)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
              child: Column(
                children: const [
                  ListTile(
                    title: Text("订单信息",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text("订单编号：1111111xxxxxxxxxx"),
                  ),
                  ListTile(
                    title: Text("下单时间：xxxxxxxxxxx"),
                  ),
                  ListTile(
                    title: Text("支付方式：xxxxxxxxxxx"),
                  ),
                  ListTile(
                    title: Text("支付时间：xxxxxxxxxxx"),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenAdapter.height(40)),
            //配送信息
            Container(
              padding: EdgeInsets.only(
                  top: ScreenAdapter.height(20),
                  bottom: ScreenAdapter.height(20)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
              child: Column(
                children: const [
                  ListTile(
                    title: Text("配送信息",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text("配送方式：圆通快递"),
                  ),
                  ListTile(
                    title: Text("收货人:张三 15201686411"),
                  ),
                  ListTile(
                    title: Text("收货地址:北京市海淀区西二旗"),
                  ),
                  ListTile(
                    title: Text("期望配送时间:2022-11-13  9:00-21:00"),
                  ),
                ],
              ),
            ),
            //支付金额
            SizedBox(height: ScreenAdapter.height(40)),
            Container(
              padding: EdgeInsets.only(
                  top: ScreenAdapter.height(20),
                  bottom: ScreenAdapter.height(20)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
              child: Column(
                children: const [
                  ListTile(
                    title: Text("商品总额"),
                    trailing: Text("¥218元"),
                  ),
                  ListTile(
                    title: Text("运费"),
                    trailing: Text("¥0元"),
                  ),
                  ListTile(
                    trailing: Text("实付款 ¥218元"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  //自定义item
  Widget checkoutItem() {
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
              "https://www.itying.com/images/shouji.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "小米5A",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenAdapter.height(10),
              ),
              Text(
                "白色128GB",
              ),
              SizedBox(
                height: ScreenAdapter.height(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "¥1234",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    "x2",
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
