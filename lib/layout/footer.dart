import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/images.dart';
import 'device.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: kAaxepDeepBlack,
        padding: EdgeInsets.symmetric(vertical: Device.margin(context), horizontal: Device.grid(context) * 2),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: Device.grid(context) * 0.5),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Center(child: Image.asset(Images.logo, height: 65))
            ]),
          ),
          const Text('All rights reserved. Copyright © 2021 AAXEP', style: TextStyle(color: Colors.white))
        ]));
  }
}
