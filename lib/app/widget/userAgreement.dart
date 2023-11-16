import 'package:flutter/material.dart';
import 'package:getxclidemo01/app/services/screenAdapter.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.width(33)),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {},
            activeColor: Colors.red,
          ),
          Text("已阅读并同意"),
          Text(
            "<<商城协议>>",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "<<商城用户协议>>",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "<<商城用户协议>>",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}
