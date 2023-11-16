import 'package:getxclidemo01/app/modules/productContent/models/p_content_model.dart';

import 'storage.dart';

class CartServices {
  //增加购物车
  static addCart(
      PContentItemModel pcontent, String selectedAttr, int buyNum) async {
    /*
        1、获取本地存储的cartList数据
        2、判断cartList是否有数据
              有数据：
                  1、判断购物车有没有当前数据：
                          有当前数据：
                              1、让购物车中的当前数据数量 等于以前的 数量+现在的数量
                              2、重新写入本地存储

                          没有当前数据：
                              1、把购物车cartList的数据和当前数据拼接，拼接后重新写入本地存储。

              没有数据：
                  1、把当前商品数据以及属性数据放在数组中然后写入本地存储

                
                List list=[
                  {"_id": "1", 
                    "title": "磨砂牛皮男休闲鞋-有属性", 
                    "price": 688, 
                    "selectedAttr": "牛皮 ,系带,黄色", 
                    "count": 4, 
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  },  
                    {"_id": "2", 
                    "title": "磨xxxxxxxxxxxxx", 
                    "price": 688, 
                    "selectedAttr": "牛皮 ,系带,黄色", 
                    "count": 2, 
                    "pic":"public\upload\RinsvExKu7Ed-ocs_7W1DxYO.png",
                    "checked": true
                  }             
                  
                ]; 
      
      */

    List? cartListData = await Storage.getData("cartList");
    if (cartListData != null) {
      var hasData = cartListData.any((v) {
        return v["_id"] == pcontent.sId && v["selectedAttr"] == selectedAttr;
      });
      if (hasData) {
        for (var i = 0; i < cartListData.length; i++) {
          if (cartListData[i]["_id"] == pcontent.sId &&
              cartListData[i]["selectedAttr"] == selectedAttr) {
            cartListData[i]["count"] += buyNum;
          }
        }
        await Storage.setData("cartList", cartListData);
      } else {
        cartListData.add({
          "_id": pcontent.sId,
          "title": pcontent.title,
          "price": pcontent.price,
          "selectedAttr": selectedAttr,
          "count": buyNum,
          "pic": pcontent.pic,
          "checked": true
        });
        await Storage.setData("cartList", cartListData);
      }
    } else {
      List tempList = [];
      tempList.add({
        "_id": pcontent.sId,
        "title": pcontent.title,
        "price": pcontent.price,
        "selectedAttr": selectedAttr,
        "count": buyNum,
        "pic": pcontent.pic,
        "checked": true
      });
      await Storage.setData("cartList", tempList);
    }
  }

  //获取购物车
  static Future<List> getCartList() async {
    List? cartListData = await Storage.getData("cartList");
    if (cartListData != null) {
      return cartListData;
    } else {
      return [];
    }
  }

  // 获取选中的CartList数据
  static getCheckedCartData() async {
    List tempList = [];
    List? cartListData = await Storage.getData("cartList");
    if (cartListData != null) {
      for (var i = 0; i < cartListData.length; i++) {
        if (cartListData[i]["checked"] == true) {
          tempList.add(cartListData[i]);
        }
      }
      return cartListData;
    } else {
      return [];
    }
  }

//保存数据
  static setCartListData(cartListData) async {
    await Storage.setData("cartList", cartListData);
  }

  //清空购物车
  static clearCartData() async {
    await Storage.clear('cartList');
  }

  //结算后删除购物车中要结算的商品
  static deleteCheckOutData(checkOutList) async {
    List? cartListData = await Storage.getData("cartList");
    if (cartListData != null) {
      var tempList = [];
      for (var i = 0; i < cartListData.length; i++) {
        if (!hasCheckOutData(checkOutList, cartListData[i])) {
          tempList.add(cartListData[i]);
        }
      }
      //保存数据到购物车
      setCartListData(tempList);
    }
  }

  static hasCheckOutData(checkOutList, cartItem) {
    for (var i = 0; i < checkOutList.length; i++) {
      if (checkOutList[i]["_id"] == cartItem["_id"] &&
          checkOutList[i]["selectedAttr"] == cartItem["selectedAttr"]) {
        return true;
      }
    }
    return false;
  }
}
