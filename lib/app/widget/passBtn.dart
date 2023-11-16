import 'package:flutter/material.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

// ignore: must_be_immutable
class PassButton extends StatelessWidget {
  final String btnText;
  void Function()? onPressed;
  PassButton({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(100)),
      height: ScreenAdapter.height(140),
      width: ScreenAdapter.width(1000),
      padding: EdgeInsets.only(
          left: ScreenAdapter.width(40), right: ScreenAdapter.width(40)),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(btnText),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenAdapter.height(70)))),
            backgroundColor: MaterialStateProperty.all(Colors.orange),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
      ),
    );
  }
}
