import "package:dio/dio.dart";

class NetWorkTool {
  static String domain = "https://xiaomi.itying.com/";
  static Dio dio = Dio();
  NetWorkTool() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  Future get(url) async {
    try {
      var result = dio.get(url);
      print(domain + url + "这里是接口数据== == == == == ==");
      return result;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }

  Future post(url, {Map? data}) async {
    try {
      var result = dio.post(url, data: data);
      print(domain + url + "这里是接口数据== == == == == ==");
      return result;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }

  replaceUrl(url) {
    String soureceUrl = domain + url;
    return soureceUrl.replaceAll("\\", "/");
  }
}
