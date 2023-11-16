import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/address/addressList/controllers/address_list_controller.dart';
import 'package:getxclidemo01/app/modules/home/model/user_model.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/signService.dart';
import 'package:getxclidemo01/app/services/userService.dart';

class AddressAddController extends GetxController {
  final AddressListController addressListController =
      Get.find<AddressListController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  NetWorkTool netWorkTool = NetWorkTool();
  RxString areaString = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    addressListController.getAddressList();
    super.onClose();
  }

  setArea(str) {
    areaString.value = str;
    update();
  }

  doAddAddress() async {
    List user = await UserService.getUserInfo();
    UserModel userInfo = UserModel.fromJson(user[0]);
    if (nameController.text.length < 2) {
      Get.snackbar("", "输入正确的姓名");
    } else if (!GetUtils.isPhoneNumber(phoneController.text) ||
        phoneController.text.length != 11) {
      Get.snackbar("", "输入正确的手机号");
    } else if (areaString.value.length < 2 ||
        addressController.text.contains("地址")) {
      Get.snackbar("", "输入正确的地址");
    } else {
      Map tempJson = {
        "uid": userInfo.sId,
        "name": nameController.text,
        "phone": phoneController.text,
        "address": "${areaString.value} ${addressController.text}",
      };

      var sign = SignService.getSign({...tempJson, "salt": userInfo.salt});
      var result = await netWorkTool
          .post("api/addAddress", data: {...tempJson, "sign": sign});
      if (result.data["success"]) {
        Get.back();
        Get.snackbar("", "增加新地址成功");
      } else {
        Get.snackbar("提示错误", "${result.data["message"]}");
      }
    }
  }
}
