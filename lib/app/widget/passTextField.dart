import 'package:flutter/material.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

// ignore: must_be_immutable
class PassTextField extends StatelessWidget {
  String? hintText;
  TextEditingController controller = TextEditingController();
  void Function(String)? onChanged;
  PassTextField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: ScreenAdapter.height(100)),
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(1000),
        height: ScreenAdapter.height(160),
        padding: EdgeInsets.only(left: ScreenAdapter.width(40)),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: TextInputType.number,
          autofocus: true,
          style: TextStyle(fontSize: ScreenAdapter.fontSize(49)),
          decoration:
              InputDecoration(hintText: hintText, border: InputBorder.none),
        ),
      ),
    );
  }
}
