import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/productContent/models/p_content_model.dart';
import 'package:getxclidemo01/app/services/cartServices.dart';
import 'package:getxclidemo01/app/services/networktool.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

import '../../../services/storage.dart';
import '../../../services/userService.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController

  RxDouble opacity = 0.0.obs;
  RxInt selectedTapIndex = 1.obs;
  //滚动的时候最顶部的subtab是否吸顶显示
  RxBool showTab = false.obs;
  //滚动的时候的活动详情的subtab是否吸顶显示
  RxBool showSubTab = false.obs;
  //滚动的时候的活动详情的subtab选中效果
  RxInt subTabSelectedIndex = 1.obs;
  //数据模型流
  var pContent = PContentItemModel().obs;
  //保存商品属性的选择的属性值
  RxString selectedAttr = "".obs;
  //购买的数量
  RxInt buyNum = 1.obs;

  RxList<PContentAttrModel> pAttrList = <PContentAttrModel>[].obs;

  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  double gk2Postion = 0.0;
  double gk3Postion = 0.0;

  //当前点击bottomSheet是哪里 1,选项卡,2购物车3.立即购买
  var bottomSheetAction = 2;

  final sid = Get.arguments["sid"];
  NetWorkTool netWorkTool = NetWorkTool();

  final ScrollController scrollController = ScrollController();
  List tabList = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];
  List tabSubList = [
    {"id": 1, "title": "商品介绍"},
    {"id": 2, "title": "参数规格"},
  ];

  @override
  void onInit() {
    super.onInit();
    scrollControllerListener();
    getContentData(sid);
  }

//监听滚动渐变透明
  scrollControllerListener() {
    scrollController.addListener(() {
      //获取第二块商品详情的位置
      if (gk2Postion == 0 && gk3Postion == 0) {
        getScrollPosition(scrollController.position.pixels);
      }
//判断是否显示subtab
      if (scrollController.position.pixels > gk2Postion &&
          scrollController.position.pixels < gk3Postion) {
        showSubTab.value = true;
        selectedTapIndex.value = 2;
      } else if (scrollController.position.pixels < gk2Postion) {
        showSubTab.value = false;
        selectedTapIndex.value = 1;
      } else if (scrollController.position.pixels > gk2Postion) {
        showSubTab.value = false;
        selectedTapIndex.value = 3;
      }

      if (scrollController.position.pixels <= 100 &&
          scrollController.position.pixels > 0) {
        var tempOp = scrollController.position.pixels / 100;
        opacity.value = tempOp;
      }

      if (scrollController.position.pixels <= 100) {
        if (showTab.value == true) {
          showTab.value = false;
        }
      } else {
        if (opacity.value != 1) {
          opacity.value = 1;
        }
        if (showTab.value == false) {
          showTab.value = true;
        }
      }
    });
    // update();
  }

//获取详情和推荐的高度位置
  getScrollPosition(pixels) {
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    gk2Postion = box2.localToGlobal(Offset.zero).dy +
        pixels -
        ScreenAdapter.kStatusBarHeight() -
        ScreenAdapter.height(120);

    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk3Postion = box3.localToGlobal(Offset.zero).dy +
        pixels -
        ScreenAdapter.kStatusBarHeight() -
        ScreenAdapter.height(120);

    print(gk2Postion);
    print(gk3Postion);
  }

  getContentData(sid) async {
    var temp = await netWorkTool
        .get("https://xiaomi.itying.com/api/pcontent?id=${sid}");
    if (temp != null) {
      var tempData = PContentModel.fromJson(temp.data);
      pContent.value = tempData.result!;
      pAttrList.value = pContent.value.attr!;
      pAttrInit();
      getSelectedAttr();
    }
  }

  pAttrInit() {
    for (var i = 0; i < pAttrList.length; i++) {
      for (var j = 0; j < pAttrList[i].list!.length; j++) {
        if (j == 0) {
          pAttrList[i]
              .attrList!
              .add({"title": pAttrList[i].list![j], "checked": true});
        } else {
          pAttrList[i]
              .attrList!
              .add({"title": pAttrList[i].list![j], "checked": false});
        }
      }
    }
  }

  ///修改自定义的商品类型模型选中数据
  changeAttr(cate, title) {
    for (var i = 0; i < pAttrList.length; i++) {
      if (pAttrList[i].cate == cate) {
        for (var j = 0; j < pAttrList[i].attrList!.length; j++) {
          pAttrList[i].attrList![j]["checked"] = false;
          if (pAttrList[i].attrList![j]["title"] == title) {
            pAttrList[i].attrList![j]["checked"] = true;
          }
        }
      }
    }

    update();
  }

//获取属性值
  getSelectedAttr() {
    List tempList = [];
    for (var i = 0; i < pAttrList.length; i++) {
      for (var j = 0; j < pAttrList[i].attrList!.length; j++) {
        if (pAttrList[i].attrList![j]["checked"] == true) {
          tempList.add(pAttrList[i].attrList![j]["title"]);
        }
      }
    }
    selectedAttr.value = tempList.join(",");
  }

  //商品数量增加
  incBuyNum() {
    buyNum.value++;
  }

  //商品数量减少
  decBuyNum() {
    if (buyNum.value > 1) {
      buyNum.value--;
    }
  }

//加入购物车
  void addCart() {
    getSelectedAttr();
    CartServices.addCart(pContent.value, selectedAttr.value, buyNum.value);
    Get.back();
    Get.snackbar("提示", "加入购物车成功");
  }

//立即购买
  void buy() {
    getSelectedAttr();
    checkout();
    Get.back();
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
      var tempList = [];
      tempList.add({
        "_id": pContent.value.sId,
        "title": pContent.value.title,
        "price": pContent.value.price,
        "selectedAttr": selectedAttr.value,
        "count": buyNum.value,
        "pic": pContent.value.pic,
        "checked": true
      });
      Storage.setData("checkoutList", tempList);
      Get.toNamed("/checkout");
    } else {
      Get.toNamed("/code-login-step-one");
    }
  }

//修改详情里的商品介绍/参数规格数据按钮切换
  changeSubTabSelected(selectedIndex) {
    subTabSelectedIndex.value = selectedIndex;
    scrollController.jumpTo(gk2Postion);
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
