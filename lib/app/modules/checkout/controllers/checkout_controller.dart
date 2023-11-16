import 'dart:convert';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/cart/controllers/cart_controller.dart';
import 'package:getxclidemo01/app/services/cartServices.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/storage.dart';

import '../../../services/signService.dart';
import '../../../services/userService.dart';
import '../../home/model/address_model.dart';
import '../../home/model/user_model.dart';

class CheckoutController extends GetxController {
  CartController cartController = Get.find<CartController>();
  NetWorkTool netWorkTool = NetWorkTool();
  RxList checkoutLists = [].obs;
  RxList<AddressItemModel> addressList = <AddressItemModel>[].obs;
  RxDouble totalPrice = 0.0.obs;
  RxInt totalGoodsNum = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("oninit1");
    getCheckoutList();
    getDefultAddress();
  }

  @override
  void onReady() {
    print("oninit2");
    super.onReady();
  }

  @override
  void onClose() {
    print("oninit3");
    super.onClose();
  }

  getCheckoutList() async {
    List temp = await Storage.getData("checkoutList");
    checkoutLists.value = temp;
    totalCheckedPriceFunc();
  }

  getDefultAddress() async {
    List user = await UserService.getUserInfo();
    UserModel userInfo = UserModel.fromJson(user[0]);
    Map tempJson = {
      "uid": userInfo.sId,
    };

    var sign = SignService.getSign({...tempJson, "salt": userInfo.salt});
    var result = await netWorkTool.get(
      "api/oneAddressList?uid=${userInfo.sId}&sign=$sign",
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

  //计算所有选中的价格综合
  totalCheckedPriceFunc() {
    if (checkoutLists.isNotEmpty) {
      var tempTotalPrice = 0.0;
      int tempNum = 0;
      print(checkoutLists);
      for (var i = 0; i < checkoutLists.length; i++) {
        tempTotalPrice = tempTotalPrice +
            checkoutLists[i]["price"] * checkoutLists[i]["count"];
        tempNum += checkoutLists[i]["count"] as int;
      }
      totalGoodsNum.value = tempNum;
      totalPrice.value = tempTotalPrice;
    } else {
      totalPrice.value = 0;
    }

    update();
  }

  //去结算
  doCheckout() async {
    if (addressList.isEmpty) {
      Get.snackbar("提示", "请选择收货地址");
      return;
    }
    List user = await UserService.getUserInfo();
    UserModel userInfo = UserModel.fromJson(user[0]);
    Map tempJson = {
      "uid": userInfo.sId,
      "name": addressList[0].name,
      "phone": addressList[0].phone,
      "address": addressList[0].address,
      "all_price": totalPrice.value.toStringAsFixed(1), //转成字符串同时保留一位小数
      "products": json.encode(checkoutLists),
    };

    var sign = SignService.getSign({...tempJson, "salt": userInfo.salt});
    var result = await netWorkTool
        .post("api/doOrder", data: {...tempJson, "sign": sign});
    if (result.data["success"]) {
      Get.snackbar("", "提交订单成功");
      //删除购物车数据
      await CartServices.deleteCheckOutData(checkoutLists);
      //更新购物车数据
      cartController.getCartListData();
      Get.toNamed("/pay");
    } else {
      Get.snackbar("提示错误", "${result.data["message"]}");
    }
    print(result);
    update();
  }
}
