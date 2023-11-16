import 'package:flutter/material.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
      alignment: Alignment.center,
      child: SizedBox(
        height: ScreenAdapter.width(180),
        width: ScreenAdapter.width(180),
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
