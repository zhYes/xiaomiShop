// ignore: file_names
// ignore: file_names
import 'dart:math';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static width(num v) {
    return v.w;
  }

  static kStatusBarHeight() {
    return ScreenUtil().statusBarHeight;
  }

  static height(num v) {
    return v.h;
  }

  static fontSize(num v) {
    return v.sp;
  }

  static kscreenWidth() {
    return 1.sw;
  }

  static kscreenHeight() {
    return 1.sh;
  }

  static randomColor() {
    return Color.fromARGB(255, Random().nextInt(256) + 0,
        Random().nextInt(256) + 0, Random().nextInt(256) + 0);
  }
}
