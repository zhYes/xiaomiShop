import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:getxclidemo01/app/modules/home/model/address_model.dart';
import 'package:getxclidemo01/app/services/networktool.dart';

import '../../../../services/signService.dart';
import '../../../../services/userService.dart';
import '../../../home/model/user_model.dart';

class AddressListController extends GetxController {
  NetWorkTool netWorkTool = NetWorkTool();
  RxList<AddressItemModel> addressList = <AddressItemModel>[].obs;
  CheckoutController checkoutController = Get.find<CheckoutController>();
  @override
  void onInit() {
    getAddressList();
    print("onint == === === on init");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    print("onint == === === on init");
  }

  @override
  void onClose() {
    print("onint == === === on init");
    super.onClose();
  }

//获取收货地址列表
  getAddressList() async {
    List user = await UserService.getUserInfo();
    UserModel userInfo = UserModel.fromJson(user[0]);
    Map tempJson = {
      "uid": userInfo.sId,
    };

    var sign = SignService.getSign({...tempJson, "salt": userInfo.salt});
    var result = await netWorkTool.get(
      "api/addressList?uid=${userInfo.sId}&sign=$sign",
    );
    print("$result 666 == == 55");
    if (result.data["success"]) {
      var temp = AddressModel.fromJson(result.data).result!;
      addressList.value = temp;
    } else {
      Get.snackbar("提示错误", "${result.data["message"]}");
    }
    update();
  }

//点击修改默认收货地址
  changeDefaultAddressList(sId) async {
    List user = await UserService.getUserInfo();
    UserModel userInfo = UserModel.fromJson(user[0]);
    Map tempJson = {"uid": userInfo.sId, "id": sId};

    var sign = SignService.getSign({...tempJson, "salt": userInfo.salt});
    var result = await netWorkTool
        .post("api/changeDefaultAddress", data: {...tempJson, "sign": sign});

    if (result.data["success"]) {
      checkoutController.getDefultAddress();
      Get.back();
    } else {
      Get.snackbar("提示错误", "${result.data["message"]}");
    }
    update();
  }

  //删除收货地址
  doDeleteAddress(addressID) async {
    List user = await UserService.getUserInfo();
    UserModel userInfo = UserModel.fromJson(user[0]);

    Map tempJson = {
      "id": addressID,
      "uid": userInfo.sId,
    };

    var sign = SignService.getSign({...tempJson, "salt": userInfo.salt});
    var result = await netWorkTool
        .post("api/deleteAddress", data: {...tempJson, "sign": sign});
    if (result.data["success"]) {
      Get.snackbar("", "删除地址成功");
      getAddressList();
    } else {
      Get.snackbar("提示错误", "${result.data["message"]}");
    }
  }
}
