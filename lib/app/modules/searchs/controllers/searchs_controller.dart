import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/searchServices.dart';
import 'package:getxclidemo01/app/services/storage.dart';

class SearchsController extends GetxController {
  //TODO: Implement SearchsController

  String keyWords = "";
  RxList historyList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getBaseHistoryList();
    print("333===333==333===33");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getBaseHistoryList() async {
    var temp = await SearchServices.getHistoryData();

    if (temp.isNotEmpty) {
      historyList.clear();
      historyList.addAll(temp);
      update();
    }
  }

  clearBaseHistoryList() {
    SearchServices.clearHistoryData();
    historyList.clear();
    update();
  }

  removeItemHistory(keyWords) {
    if (historyList.isNotEmpty) {
      historyList.remove(keyWords);
      Storage.setData("searchList", historyList);
      // update();
      // print("${historyList} + 这是数据库");
    }
  }
}
