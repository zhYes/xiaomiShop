import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/order_model.dart';
import 'package:getxclidemo01/app/modules/home/model/user_model.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/signService.dart';
import 'package:getxclidemo01/app/services/userService.dart';

class OrderController extends GetxController {
  NetWorkTool netWorkTool = NetWorkTool();
  RxList<OrderInfoModel> orderList = <OrderInfoModel>[].obs;

  void onInit() {
    super.onInit();
    getOrderList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getOrderList() async {
    List userList = await UserService.getUserInfo();
    UserModel userModel = UserModel.fromJson(userList[0]);

    String sign =
        SignService.getSign({"uid": userModel.sId, "salt": userModel.salt});
    var result =
        await netWorkTool.get("api/orderList?uid=${userModel.sId}&sign=$sign");
    print(result);
    OrderModel temp = OrderModel.fromJson(result.data);
    orderList.value = temp.result!;
  }
}
