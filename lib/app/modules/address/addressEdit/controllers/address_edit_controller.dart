import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../services/networktool.dart';
import '../../../../services/signService.dart';
import '../../../../services/userService.dart';
import '../../../home/model/user_model.dart';
import '../../addressList/controllers/address_list_controller.dart';

class AddressEditController extends GetxController {
  final AddressListController addressListController =
      Get.find<AddressListController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  var addressID = Get.arguments["id"];
  final AddressListController listController =
      Get.find<AddressListController>();

  NetWorkTool netWorkTool = NetWorkTool();
  RxString areaString = "".obs;
  @override
  void onInit() {
    initAddressData();
    super.onInit();
  }

  initAddressData() {
    nameController.text = Get.arguments["name"];
    phoneController.text = Get.arguments["phone"];
    String addressAreaString = Get.arguments["address"];
    List addressArea = addressAreaString.split(" ");
    areaString.value = "${addressArea[0]} ${addressArea[1]} ${addressArea[2]}";
    addressArea.removeRange(0, 3);
    addressController.text = addressArea.join(" ");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setArea(str) {
    areaString.value = str;
    update();
  }

  doEditAddress() async {
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
        "id": addressID,
        "uid": userInfo.sId,
        "name": nameController.text,
        "phone": phoneController.text,
        "address": "${areaString.value} ${addressController.text}",
      };

      var sign = SignService.getSign({...tempJson, "salt": userInfo.salt});
      var result = await netWorkTool
          .post("api/editAddress", data: {...tempJson, "sign": sign});
      if (result.data["success"]) {
        Get.back();
        Get.snackbar("", "修改地址成功");
        listController.getAddressList();
      } else {
        Get.snackbar("提示错误", "${result.data["message"]}");
      }
    }
  }
}
