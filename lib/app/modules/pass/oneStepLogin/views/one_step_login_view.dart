import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/one_step_login_controller.dart';

class OneStepLoginView extends GetView<OneStepLoginController> {
  const OneStepLoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OneStepLoginView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OneStepLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
