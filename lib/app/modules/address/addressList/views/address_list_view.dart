import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getxclidemo01/app/services/screenAdapter.dart';

import '../controllers/address_list_controller.dart';

class AddressListView extends GetView<AddressListController> {
  const AddressListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 240, 246, 1),
        appBar: AppBar(
          title: const Text('收货地址'),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [_bodyListView(), _bottomPostion()],
        ));
  }

  _bodyListView() {
    return Obx(() => ListView(
          padding: EdgeInsets.only(
              top: ScreenAdapter.height(40),
              left: ScreenAdapter.height(40),
              right: ScreenAdapter.height(40),
              bottom: ScreenAdapter.height(300)),
          children: controller.addressList
              .map((e) => Container(
                    padding: EdgeInsets.all(ScreenAdapter.height(20)),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenAdapter.height(20)),
                        color: Colors.white),
                    child: ListTile(
                        onTap: () {
                          controller.changeDefaultAddressList(e.sId);
                        },
                        onLongPress: () {
                          Get.defaultDialog(
                            title: "确定删除地址吗?",
                            middleText: "删除后无法恢复",
                            confirm: ElevatedButton(
                                onPressed: () {
                                  controller.doDeleteAddress(e.sId);
                                  Get.back();
                                },
                                child: Text("确定")),
                            cancel: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("取消")),
                          );
                        },
                        leading: Icon(
                          Icons.check,
                          color: e.defaultAddress == 1
                              ? Colors.red
                              : Colors.black12,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${e.address}",
                              style: TextStyle(color: Colors.black87),
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(24),
                            ),
                            Text(
                              "${e.name} ${e.phone}",
                            ),
                            SizedBox(
                              height: ScreenAdapter.height(24),
                            )
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Get.toNamed("/address-edit", arguments: {
                              "name": e.name,
                              "id": e.sId,
                              "phone": e.phone,
                              "address": e.address
                            });
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        )),
                  ))
              .toList(),
        ));
  }

  _bottomPostion() {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Container(
          padding: EdgeInsets.all(ScreenAdapter.height(20)),
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(210),
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Color.fromARGB(178, 240, 236, 236),
                      width: ScreenAdapter.height(2))),
              color: Colors.white),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(255, 165, 0, 0.9)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                      // CircleBorder()
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
              onPressed: () {
                controller.getAddressList();
                Get.toNamed("/address-add");
              },
              child: Text("增加新地址")),
        ));
  }
}
