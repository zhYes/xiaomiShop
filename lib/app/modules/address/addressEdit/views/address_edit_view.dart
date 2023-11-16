import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../services/screenAdapter.dart';
import '../controllers/address_edit_controller.dart';

class AddressEditView extends GetView<AddressEditController> {
  const AddressEditView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('新增收货地址'),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(ScreenAdapter.height(40)),
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    "姓名",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(44)),
                  ),
                  // Divider(),
                  SizedBox(
                    width: ScreenAdapter.width(40),
                  ),
                  Expanded(
                      child: TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: ScreenAdapter.fontSize(45)),
                        hintText: "请输入姓名",
                        border: InputBorder.none),
                  )),
                ],
              ),
            ),
            Divider(),
            Container(
              child: Row(
                children: [
                  Text(
                    "电话",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(44)),
                  ),
                  // Divider(),
                  SizedBox(
                    width: ScreenAdapter.width(40),
                  ),
                  Expanded(
                      child: TextField(
                    controller: controller.phoneController,
                    decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: ScreenAdapter.fontSize(45)),
                        hintText: "请输入电话",
                        border: InputBorder.none),
                  )),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: ScreenAdapter.height(40),
            ),
            Container(
              child: InkWell(
                onTap: () async {
                  Result? result =
                      await CityPickers.showCityPicker(context: context);
                  if (result != null) {
                    print(result);

                    String areaString =
                        "${result.provinceName} ${result.cityName} ${result.areaName}";
                    controller.setArea(areaString);
                  }
                },
                child: Row(
                  children: [
                    Text(
                      "所在地区",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(44)),
                    ),
                    // Divider(),
                    SizedBox(
                      width: ScreenAdapter.width(40),
                    ),
                    Expanded(
                        child: Obx(() => Text(
                              controller.areaString.value == ""
                                  ? "选择地区"
                                  : controller.areaString.value,
                            ))),
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              child: Row(
                children: [
                  Text(
                    "详细地址",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(44)),
                  ),
                  // Divider(),
                  SizedBox(
                    width: ScreenAdapter.width(40),
                  ),
                  Expanded(
                      child: TextField(
                    controller: controller.addressController,
                    decoration: InputDecoration(
                        hintStyle:
                            TextStyle(fontSize: ScreenAdapter.fontSize(45)),
                        hintText: "请输入详细地址",
                        border: InputBorder.none),
                  )),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: ScreenAdapter.height(100),
            ),
            Container(
              height: ScreenAdapter.height(200),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    // controller.doAddAddress();
                    controller.doEditAddress();
                  },
                  child: Text(
                    "确定修改",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ));
  }
}
