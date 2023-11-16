import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/modules/productContent/controllers/product_content_controller.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

class SecondPageViewView extends GetView {
  final ProductContentController controller = Get.find();
  final Function subHeader;
  SecondPageViewView(this.subHeader, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      // height: ScreenAdapter.kscreenHeight(),

      width: ScreenAdapter.kscreenWidth(),
      color: Colors.blue,
      child: Obx(() => controller.pContent.value.content == null
          ? Text("")
          : Column(
              children: [subHeader(), subContentView()],
            )),
    );
  }

  subContentView() {
    return controller.subTabSelectedIndex == 1
        ? Container(
            width: ScreenAdapter.width(1080),
            child: Html(
              shrinkWrap: true,
              data: controller.pContent.value.content!,
              style: {
                "body": Style(backgroundColor: Colors.white),
                "p": Style(fontSize: FontSize.large),
              },
            ))
        : Container(
            width: ScreenAdapter.width(1080),
            child: Html(
              shrinkWrap: true,
              data: controller.pContent.value.specs!,
              style: {
                "body": Style(backgroundColor: Colors.white),
                "p": Style(fontSize: FontSize.large),
              },
            ),
          );
  }
}
