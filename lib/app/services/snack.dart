import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackMe extends StatelessWidget {
  const SnackMe({super.key});

  @override
  Widget build(BuildContext context) {
    snackMe() {
      Timer(Duration(milliseconds: 100), () {
        Get.snackbar("1111", "111");
      });
    }

    snackMe();
    return Container();
  }
}
