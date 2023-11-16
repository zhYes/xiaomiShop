// import 'dart:convert';
// import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

import '../controllers/home_controller.dart';
import ',,/../../../../services/keepAliveWrapper.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  final Color topClolor = Colors.white;
  final Color bottomColor = Colors.black38;

  ///轮播图
  Widget _swiperFocus() {
    return SizedBox(
        width: ScreenAdapter.kscreenWidth(),
        height: ScreenAdapter.height(682),
        child: Obx(() => Swiper(
              itemCount: controller.swiperList.length,
              autoplay: true,
              pagination:
                  const SwiperPagination(builder: SwiperPagination.rect),
              itemBuilder: (context, index) {
                // https://www.itying.com/
                var url =
                    "https://xiaomi.itying.com/${controller.swiperList[(index)].pic}";

                url = url.replaceAll("\\", "/");
                // print(url);
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                );
              },
            )));
  }

  Widget _homePage(context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -MediaQuery.of(context).padding.top,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [
          _swiperFocus(),
          _bannerImage(),
          _homeCategory(),
          _bannerImage2(),
          _bestSelling(),
          _bestSelling2(),
          _staggedGriderView(),
          _staggedGriderView2(),
        ],
      ),
    );
  }

  ///分类
  Widget _homeCategory() {
    return SizedBox(
        width: ScreenAdapter.kscreenWidth(),
        height: ScreenAdapter.width(470),
        // decoration: const BoxDecoration(color: Colors.red),
        child: Obx(
          () => Swiper(
            pagination: const SwiperPagination(builder: SwiperPagination.rect),
            itemCount: controller.categoryList.length ~/ 10,
            itemBuilder: (context, index) {
              return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: ScreenAdapter.width(20),
                    mainAxisSpacing: ScreenAdapter.height(20)),
                itemBuilder: (context, i) {
                  var url =
                      "https://xiaomi.itying.com/${controller.categoryList[(index * 10) + i].pic}";
                  // "https://www.itying.com/${controller.pics[0]}";
                  url = url.replaceAll("\\", "/");
                  // print(url);
                  return Column(
                    children: [
                      SizedBox(
                        width: ScreenAdapter.width(140),
                        height: ScreenAdapter.width(140),
                        child: Image.network(
                          url,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(10), 0, 0),
                          child: Text(
                            controller.categoryList[index * 10 + i].title!,
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                          )),
                    ],
                  );
                },
              );
            },
          ),
        ));
  }

  ///灰色图片banner
  Widget _bannerImage() {
    return Container(
      width: ScreenAdapter.kscreenWidth(),
      height: ScreenAdapter.height(92),
      color: Colors.transparent,
      child: Image.asset("assets/images/xiaomiBanner.png"),
    );
  }

  ///手机图片banner2
  Widget _bannerImage2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
      child: Container(
        width: ScreenAdapter.kscreenWidth(),
        height: ScreenAdapter.height(420),
        // color: Colors.transparent,
        decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(ScreenAdapter.width(40)),
            image: const DecorationImage(
                image: AssetImage("assets/images/xiaomiBanner2.png"),
                fit: BoxFit.cover)),
      ),
    );
  }

  ///省心优惠  更多手机
  Widget _bestSelling() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "热销臻选",
            style: TextStyle(
                fontSize: ScreenAdapter.fontSize(46),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "更多手机 >",
            style: TextStyle(fontSize: ScreenAdapter.fontSize(38)),
          ),
        ],
      ),
    );
  }

  ///省心优惠  更多手机
  Widget _staggedGriderView() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(20),
          ScreenAdapter.width(20),
          ScreenAdapter.width(20),
          ScreenAdapter.width(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "省心优惠精选",
            style: TextStyle(
                fontSize: ScreenAdapter.fontSize(46),
                fontWeight: FontWeight.bold),
          ),
          Text(
            "更多商品 >",
            style: TextStyle(fontSize: ScreenAdapter.fontSize(38)),
          ),
        ],
      ),
    );
  }

  ///省心优惠瀑布流
  Widget _staggedGriderView2() {
    return Obx(() => Padding(
          padding: EdgeInsets.all(ScreenAdapter.width(20)),
          child: MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            itemCount: controller.sellingBottomList.length,
            mainAxisSpacing: ScreenAdapter.width(20),
            crossAxisSpacing: ScreenAdapter.width(20),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed("/product-content", arguments: {
                    "sid": controller.sellingBottomList[index].sId
                  });
                },
                child: Container(
                  // height: 100 + Random().nextDouble() * 40,
                  padding: EdgeInsets.all(ScreenAdapter.width(50)),
                  decoration: BoxDecoration(
                    border: Border.all(color: ScreenAdapter.randomColor()),
                    borderRadius:
                        BorderRadius.circular(ScreenAdapter.width(20)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          "http://xiaomi.itying.com/${controller.sellingBottomList[index].pic}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        child: Text(
                          "${controller.sellingBottomList[index].title}",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(36),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        width: double.infinity,
                        child: Text(
                          "${controller.sellingBottomList[index].subTitle}",
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(32)),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.width(10)),
                        width: double.infinity,
                        child: Text(
                          "¥${controller.sellingBottomList[index].price}",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(25),
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  ///热销臻选
  Widget _bestSelling2() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Container(
              height: ScreenAdapter.height(760),
              child: Obx(() => Swiper(
                    itemCount: controller.swiperSellingList.length,
                    // pagination:
                    //     const SwiperPagination(builder: SwiperPagination.rect),
                    pagination:
                        const SwiperPagination(builder: SwiperPagination.rect),
                    autoplay: true,
                    itemBuilder: (context, index) {
                      return Image.network(
                        "https://xiaomi.itying.com/${controller.swiperSellingList[index].pic}",
                        fit: BoxFit.fill,
                      );
                    },
                  )),
            )),
        SizedBox(
          width: ScreenAdapter.width(20),
        ),

        ///右侧
        Expanded(
            flex: 1,
            child: Container(
                height: ScreenAdapter.height(760),
                child: Obx(() => Column(
                        children:
                            controller.sellingSubList.asMap().entries.map((e) {
                      var model = e.value;
                      var index = e.key;
                      return Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0,
                              index == 2 ? 0 : ScreenAdapter.height(20)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      model.title!,
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(38),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      model.subTitle!,
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(28)),
                                    ),
                                    SizedBox(
                                      height: ScreenAdapter.height(20),
                                    ),
                                    Text(
                                      "¥${model.price}元",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(34)),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    ScreenAdapter.height(10),
                                    0,
                                    ScreenAdapter.height(10),
                                  ),
                                  child: Image.network(
                                      "https://xiaomi.itying.com/${model.pic}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList()))))
      ]),
    );
  }

  Widget _appBar() {
    return Positioned(

        ///这是导航栏 ***8 ///这是导航栏 *** ///这是导航栏
        left: 0,
        right: 0,
        top: -0,
        child: Obx(() => AppBar(
              leadingWidth: controller.flag.value
                  ? ScreenAdapter.width(0)
                  : ScreenAdapter.width(140),
              leading: controller.flag.value == false
                  ? Icon(
                      Icons.home,
                      color: controller.flag.value == false
                          ? topClolor
                          : bottomColor,
                    )
                  : Text(""),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code,
                      color:
                          controller.flag.value ? Colors.black87 : Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.message,
                        color: controller.flag.value
                            ? Colors.black87
                            : Colors.white))
              ],
              title: InkWell(
                onTap: () {
                  Get.toNamed(Routes.SEARCHS);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  width: controller.flag.value
                      ? ScreenAdapter.width(800)
                      : ScreenAdapter.width(620),
                  height: ScreenAdapter.height(96),
                  decoration: BoxDecoration(
                      color: controller.flag.value == false
                          ? topClolor
                          : bottomColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: ScreenAdapter.width(34)),
                        child: const Icon(
                          Icons.search,
                          color: Colors.black12,
                        ),
                      ),
                      Text(
                        "手机",
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: ScreenAdapter.fontSize(32)),
                      )
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              backgroundColor: controller.flag.value == false
                  ? Colors.transparent
                  : topClolor,
              elevation: 0,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
        child: Scaffold(
            body: Stack(
      children: [_homePage(context), _appBar()],
    )));
  }
}
