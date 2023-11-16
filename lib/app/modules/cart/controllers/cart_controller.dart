import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/cartServices.dart';
import 'package:getxclidemo01/app/services/storage.dart';
import 'package:getxclidemo01/app/services/userService.dart';

class CartController extends GetxController {
  //TODO: Implement CartController
  RxList cartList = [].obs;
  RxBool checkBoxAll = false.obs;
  RxDouble totalPrice = 0.0.obs;
  RxBool isEditor = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // getCartListData();//在GetBuilder中调用
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getCartListData() async {
    var tempList = await CartServices.getCartList();
    cartList.value = tempList;
    checkBoxAll.value = isCheckedBoxAll();
    update();
  }

  //增加数量
  void incCartNum(cartItem) {
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["_id"] == cartItem["_id"] &&
          cartList[i]["selectedAttr"] == cartItem["selectedAttr"]) {
        cartList[i]["count"]++;
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    update();
    CartServices.setCartListData(cartList);
    totalCheckedPriceFunc();
  }

  //减少数量
  void decCartNum(cartItem) {
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["_id"] == cartItem["_id"] &&
          cartList[i]["selectedAttr"] == cartItem["selectedAttr"]) {
        if (cartList[i]["count"] > 1) {
          cartList[i]["count"]--;
        } else {
          Get.snackbar("提示", "购物车数量已经到最小了");
        }
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    update();
    CartServices.setCartListData(cartList);
    totalCheckedPriceFunc();
  }

  //点击每个checkBox更新数据
  void checkCartItem(cartItem) {
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["_id"] == cartItem["_id"] &&
          cartList[i]["selectedAttr"] == cartItem["selectedAttr"]) {
        cartList[i]["checked"] = !cartList[i]["checked"];
      }
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    checkBoxAll.value = isCheckedBoxAll();
    update();
    CartServices.setCartListData(cartList);
  }

  //全部选中或不选中
  checkedBoxAllFunc(value) {
    checkBoxAll.value = value;
    var tempList = [];
    for (var i = 0; i < cartList.length; i++) {
      cartList[i]["checked"] = value;
      tempList.add(cartList[i]);
    }
    cartList.value = tempList;
    update();
    CartServices.setCartListData(cartList);
    totalCheckedPriceFunc();
  }

  //判断是否出发底部全选状态
  bool isCheckedBoxAll() {
    totalCheckedPriceFunc();
    if (cartList.isNotEmpty) {
      for (var i = 0; i < cartList.length; i++) {
        if (cartList[i]["checked"] == false) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  //计算所有选中的价格综合
  totalCheckedPriceFunc() {
    if (cartList.isNotEmpty) {
      var tempTotalPrice = 0.0;
      for (var i = 0; i < cartList.length; i++) {
        if (cartList[i]["checked"] == true) {
          tempTotalPrice =
              tempTotalPrice + cartList[i]["price"] * cartList[i]["count"];
        }
      }
      totalPrice.value = tempTotalPrice;
    } else {
      totalPrice.value = 0;
    }

    update();
    print(totalPrice.value);
  }

//获取选中的商品
  List getSelectedData() {
    List temp = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["checked"] == true) {
        temp.add(cartList[i]);
      }
    }
    return temp;
  }

  //判断是否登录
  isLogin() async {
    return await UserService.getUserInfoLoginState();
  }

  //处理结算逻辑
  checkout() async {
    bool islogin = await isLogin();
    if (islogin) {
      //登录了,检查是否选中商品/价格是否为0
      var tempList = getSelectedData();
      if (tempList.isEmpty) {
        Get.snackbar("提示", "您还没有选中商品");
      } else {
        Storage.setData("checkoutList", tempList);
        Get.toNamed("/checkout");
      }
    } else {
      Get.toNamed("/code-login-step-one");
    }
  }

  //是否编辑删除的状态
  changeEditor() {
    isEditor.value = !isEditor.value;
    update();
  }

  deleteCheckout() {
    List temp = [];
    for (var i = 0; i < cartList.length; i++) {
      if (cartList[i]["checked"] == false) {
        temp.add(cartList[i]);
      }
    }
    if (temp.length == cartList.length) {
      Get.snackbar("提示", "请选择要删除的商品");
      return;
    }
    cartList.value = temp;
    update();
    CartServices.setCartListData(cartList);
  }
}
