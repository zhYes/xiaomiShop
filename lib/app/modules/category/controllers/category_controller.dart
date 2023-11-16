// import 'package:dio/dio.dart';
import '../../../services/networktool.dart';
import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/home/model/category_model.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  RxInt selectedIndex = 0.obs;

  RxList<CategroyItem> leftCategoryList = <CategroyItem>[].obs;
  RxList<CategroyItem> rightCategoryList = <CategroyItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeSelectedIndex(index) {
    selectedIndex.value = index;
    update();
    getRightCategoryData(leftCategoryList[index].sId);
  }

  getLeftCategoryData() async {
    var result = await NetWorkTool().get("api/pcate");
    leftCategoryList.value = CategoryModel.fromJson(result.data).result!;
    update();
    getRightCategoryData(leftCategoryList[0].sId);
    // print("===    ${leftCategoryList[0].sId}   ====");
  }

  getRightCategoryData(pid) async {
    var result =
        // await Dio().get(":https://xiaomi.itying.com/api/pcate?pid=${pid}}");
        await NetWorkTool().get("api/pcate?pid=$pid");

    rightCategoryList.value = CategoryModel.fromJson(result.data).result!;

    update();
  }
}
