// import 'dart:js_util';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

import 'package:getxclidemo01/app/widget/passBtn.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(66, 154, 148, 148),
          elevation: 0,
          centerTitle: true,
          actions: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "会员码",
                style: TextStyle(fontSize: ScreenAdapter.fontSize(44)),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.qr_code_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
          ],
        ),
        body: Container(
          color: Color.fromARGB(66, 154, 148, 148),
          child: ListView(
            padding: EdgeInsets.all(ScreenAdapter.height(20)),
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed("code-login-step-one");
                },
                child: Obx(() => controller.isLogin.value
                    ? Row(
                        children: [
                          Container(
                            width: ScreenAdapter.width(150),
                            height: ScreenAdapter.height(150),
                            child: CircleAvatar(
                              radius: ScreenAdapter.width(75),
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdapter.width(34),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.userInfo.value.username!,
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(46)),
                              ),
                              Text(
                                "普通会员",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(25)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: ScreenAdapter.width(34),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                            size: ScreenAdapter.height(34),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                            width: ScreenAdapter.width(150),
                            height: ScreenAdapter.height(150),
                            child: CircleAvatar(
                              radius: ScreenAdapter.width(75),
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
                            ),
                          ),
                          SizedBox(
                            width: ScreenAdapter.width(34),
                          ),
                          Text(
                            "登录/注册",
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(46)),
                          ),
                          SizedBox(
                            width: ScreenAdapter.width(34),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black54,
                            size: ScreenAdapter.height(34),
                          )
                        ],
                      )),
              ),
              Obx(() => controller.userInfo.value.gold == null
                  ? Text("")
                  : Container(
                      // height: ScreenAdapter.height(220),
                      padding:
                          EdgeInsets.only(bottom: ScreenAdapter.height(33)),
                      margin: EdgeInsets.only(top: ScreenAdapter.height(44)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "${controller.userInfo.value.gold}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(80),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "米金",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "${controller.userInfo.value.coupon}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(80),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "优惠券",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "${controller.userInfo.value.redPacket}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(80),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "红包",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Text(
                                "${controller.userInfo.value.quota}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(80),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "最高额度",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          )),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wallet_membership),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "钱包",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          ))
                        ],
                      ),
                    )),
              //ad1广告
              Container(
                margin: EdgeInsets.only(top: ScreenAdapter.height(30)),
                alignment: Alignment.center,
                // width: ScreenAdapter.width(300),
                // height: ScreenAdapter.height(300),
                child: Container(
                  width: ScreenAdapter.width(1008),
                  height: ScreenAdapter.height(300),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/user_ad1.png"),
                          fit: BoxFit.cover),
                      borderRadius:
                          BorderRadius.circular(ScreenAdapter.width(20))),
                ),
              ),
              //订单
              InkWell(
                onTap: () {
                  Get.toNamed("/order");
                },
                child: Container(
                  margin: EdgeInsets.only(top: ScreenAdapter.height(50)),
                  padding: EdgeInsets.only(top: ScreenAdapter.height(22)),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenAdapter.height(22)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: ScreenAdapter.height(100),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: Text("订单"),
                              alignment: Alignment.center,
                            )),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                left: BorderSide(
                                    width: ScreenAdapter.height(2),
                                    color: Colors.black54),
                                right: BorderSide(
                                    width: ScreenAdapter.height(2),
                                    color: Colors.black54),
                              )),
                              child: Text("收藏"),
                              alignment: Alignment.center,
                            )),
                            Expanded(
                                child: Container(
                              child: Text("足迹"),
                              alignment: Alignment.center,
                            )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdapter.height(33)),
                        padding: EdgeInsets.only(
                            left: ScreenAdapter.width(30),
                            right: ScreenAdapter.width(20)),
                        child: Divider(
                          height: ScreenAdapter.height(2),
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        height: ScreenAdapter.height(240),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.watch_outlined),
                                SizedBox(
                                  height: ScreenAdapter.height(22),
                                ),
                                Text(
                                  "待付款",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      color: Colors.black54),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.fmd_good_sharp),
                                SizedBox(
                                  height: ScreenAdapter.height(22),
                                ),
                                Text(
                                  "待收货",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      color: Colors.black54),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.comment),
                                SizedBox(
                                  height: ScreenAdapter.height(22),
                                ),
                                Text(
                                  "待评价",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      color: Colors.black54),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.back_hand),
                                SizedBox(
                                  height: ScreenAdapter.height(18),
                                ),
                                Text(
                                  "退还/售后",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      color: Colors.black54),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.format_align_center),
                                SizedBox(
                                  height: ScreenAdapter.height(22),
                                ),
                                Text(
                                  "全部订单",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(34),
                                      color: Colors.black54),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //服务 更多
              Container(
                width: ScreenAdapter.kscreenWidth(),
                margin: EdgeInsets.only(top: ScreenAdapter.height(45)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(ScreenAdapter.height(20))),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: ScreenAdapter.height(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "    服务",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(44),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "更多 >    ",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(44),
                                color: Colors.black26),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // height: ScreenAdapter.height(300),

                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        childAspectRatio: 3 / 2,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_align_center),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "全部订单",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_align_center),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "全部订单",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_align_center),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "全部订单",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_align_center),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "全部订单",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_align_center),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "全部订单",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_align_center),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "全部订单",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.format_align_center),
                              SizedBox(
                                height: ScreenAdapter.height(22),
                              ),
                              Text(
                                "全部订单",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34),
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  height: ScreenAdapter.height(330),
                  margin: EdgeInsets.only(top: ScreenAdapter.height(33)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: ScreenAdapter.height(2),
                          color: Colors.black54),
                      borderRadius:
                          BorderRadius.circular(ScreenAdapter.height(22)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/user_ad2.png"),
                          fit: BoxFit.cover)),
                ),
              ),
              PassButton(
                  btnText: "退出登录",
                  onPressed: () {
                    controller.loginOut();
                  })
            ],
          ),
        ));
  }
}
