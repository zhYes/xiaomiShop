import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

class ThirdPageViewView extends GetView {
  @override
  final ProductContentController controller = Get.find();

  ThirdPageViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        key: controller.gk3,
        height: ScreenAdapter.kscreenHeight() + ScreenAdapter.kscreenHeight(),
        width: ScreenAdapter.kscreenWidth(),
        color: Colors.purple,
        child: Column(
          children: [
            Image.network("http://www.itying.com/images/flutter/p1.jpg")
          ],
        ));
  }
}
