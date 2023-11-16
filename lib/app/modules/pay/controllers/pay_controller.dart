import 'package:get/get.dart';

class PayController extends GetxController {
  RxList payList = [
    {
      "id": 1,
      "title": "支付宝支付",
      "checked": true,
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "id": 2,
      "title": "微信支付",
      "checked": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    }
  ].obs;

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
    super.onClose();
  }

  changePayList(index) {
    List<Map<String, Object>> temp = [];
    for (var i = 0; i < payList.length; i++) {
      payList[i]["checked"] = false;
      temp.add(payList[i]);
    }

    temp[index]["checked"] = true;
    payList.value = temp;
    update();
  }
}
