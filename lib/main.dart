import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  //flutter 修改状态栏的颜色
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  runApp(
      //填入设计稿中设备的屏幕尺寸,单位dp
      ScreenUtilInit(
          designSize: const Size(1080, 2400),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              theme: ThemeData(primarySwatch: Colors.grey),
              defaultTransition: Transition.rightToLeft,
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          }));
}
