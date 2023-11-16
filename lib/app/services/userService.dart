import 'package:getxclidemo01/app/services/storage.dart';

class UserService {
  static getUserInfo() async {
    List? userInfo = await Storage.getData("userinfo");
    print("获取 == ${userInfo}");
    if (userInfo != null) {
      return userInfo;
    } else {
      return [];
    }
  }

  static getUserInfoLoginState() async {
    List? userInfo = await Storage.getData("userinfo");
    print("获取 == ${userInfo}");
    if (userInfo != null && userInfo[0]["username"] != "") {
      return true;
    } else {
      return false;
    }
  }
}
