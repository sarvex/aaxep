import 'package:flutter/material.dart';

import 'builder.dart';

class Dimension {
  Dimension._();

  static const height = 1920.0;
  static const width = 1080.0;

  static const desktopColumns = 12;
  static const mobileColumns = 6;
  static const ratioContent = 0.8;
  static const ratioMargin = 0.2;
  static const duration = 700;

  static const lightBorderWidth = 1.0;

  static const lightElevation = 1.0;
  static const darkElevation = 4.0;

  static const buttonPaddingV = 18.0;
  static const buttonPaddingH = 18.0;
  static const buttonRadius = 32.0;

  static const labelRadius = 8.0;
  static const inputRadius = 12.0;

  static const cardRadius = 8.0;
  static const cardHeight = 220.0;
  static const smallCardHeight = 100.0;

  static const appbarPhotoRadius = 22.0;

  static const inputFontSize = 32.0;

  static const appbarHeight = 120.0;

  static const xlIconSize = 34.0;
  static const iconSize = 24.0;
  static const mediumIconSize = 20.0;
  static const smallIconSize = 14.0;

  static const padding = 4.0;

  static const mobileBreakpoint = 540;

  static const smallImageSize = 32.0;
  static const sideImageSize = 145.0;
  static const thumbSize = 64.0;

  static const elevation = 4.0;

  static const bottomSheetRadius = 24.0;

  static const shimmerWidth = 90.0;
}

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

  static int layout(BuildContext context) => narrow(context) ? Dimension.mobileColumns : Dimension.desktopColumns;

  static double margin(BuildContext context) => grid(context) * Dimension.ratioMargin;

  static double column(BuildContext context) => grid(context) * Dimension.ratioContent;

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
