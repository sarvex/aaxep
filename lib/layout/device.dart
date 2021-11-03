import 'package:flutter/material.dart';

import '../config/constants.dart';
import 'responsive_builder.dart';

class Device extends StatelessWidget {
  const Device({Key? key, this.mobile, this.screen, this.desktop}) : super(key: key);

  final Widget? mobile;
  final Widget? desktop;
  final Widget? screen;

  static const mobileWidth = 720;
  static const desktopWidth = 1440;

  static bool narrow(BuildContext context) => width(context) < mobileWidth;

  static double width(BuildContext context) => MediaQuery.of(context).size.shortestSide;

  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  static int layout(BuildContext context) => narrow(context) ? kMobileColumns : kDesktopColumns;

  static double margin(BuildContext context) => grid(context) * kRatioMargin;

  static double column(BuildContext context) => grid(context) * kRatioContent;

  static double grid(BuildContext context) => width(context) / layout(context);

  @override
  Widget build(BuildContext context) => ResponsiveBuilder(
    builder: (context, size, widget) {
      Widget? widget;
      final width = MediaQuery.of(context).size.shortestSide;
      if (width > desktopWidth) {
        widget = screen ?? Center(child: desktop);
      } else if (width > mobileWidth) {
        widget = desktop;
      } else {
        widget = mobile ?? desktop;
      }
      return widget ?? Container();
    },
  );
}