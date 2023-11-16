import 'dart:convert';

import 'package:crypto/crypto.dart';

class SignService {
  static getSign(Map json) {
    List jsonKeys = json.keys.toList();
    jsonKeys.sort();
    String str = "";
    for (var i = 0; i < jsonKeys.length; i++) {
      str += "${jsonKeys[i]}${json[jsonKeys[i]]}";
    }
    var sign = md5.convert(utf8.encode(str));
    print(sign);
    return "$sign";
  }
}
