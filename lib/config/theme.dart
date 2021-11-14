import 'package:aaxep/layout/device.dart';
import 'package:flutter/material.dart';

class AaxepTheme {
  AaxepTheme._();

  static const primary = Color(0xFF0096bc);
  static const background = Color(0xFFf3f6f9);

  static const lightGrey = Color(0xFF9EA6B3);
  static const darkGrey = Color(0xFF808A9A);

// static const Black = Colors.black87;
  static const deepBlack = Color(0xFF211C1B);
  static const surfaceWhite = Color(0xFFFFFBFA);
  static const shadowBox = Color(0xFFE5E8EB);
  static const base = Color(0xFFF3F3F4);
  static const green = Color(0xFF47BE53);
  static const lightGreen = Color(0xFFDDF3DF);
  static const red = Color(0xFFFF4F4F);
  static const yellow = Color(0xFFFFCC00);
  static const orange = Color(0xFFF68839);

  static const black = Colors.black;
  static const white = Colors.white;
  static const lightWhite = Color(0xFFfafafa);

  static const logo = 'assets/images/logo.png';

  static const truck = 'assets/lottie/truck.json';
  static const navigation = 'assets/lottie/navigation.json';
  static const circleTruck = 'assets/lottie/circle-truck.json';
  static const enterprise = 'assets/lottie/enterprise.json';

  static final ThemeData lightTheme = AaxepTheme._buildAaxepTheme(Brightness.light);
  static final ThemeData darkTheme = AaxepTheme._buildAaxepTheme(Brightness.dark);

  static ThemeData _buildAaxepTheme(Brightness brightness) {
    final base = ThemeData(brightness: brightness);
    return base.copyWith(
        brightness: Brightness.dark,
        primaryColor: AaxepTheme.primary,
        buttonTheme: base.buttonTheme.copyWith(
          buttonColor: AaxepTheme.primary,
          colorScheme: base.colorScheme.copyWith(primary: AaxepTheme.primary),
          disabledColor: AaxepTheme.lightGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        buttonBarTheme: base.buttonBarTheme.copyWith(
          buttonTextTheme: ButtonTextTheme.accent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: AaxepTheme.primary, // background
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))),
        scaffoldBackgroundColor: AaxepTheme.background,
        errorColor: AaxepTheme.darkGrey,
        // textTheme: _buildAaxepLightTextTheme(base.textTheme),
        // primaryTextTheme: _buildAaxepLightTextTheme(base.primaryTextTheme),
        primaryIconTheme: base.iconTheme.copyWith(color: AaxepTheme.primary),
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimension.inputRadius)),
                borderSide: BorderSide(color: AaxepTheme.lightGrey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimension.inputRadius)),
                borderSide: BorderSide(color: AaxepTheme.lightGrey)),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: TextStyle(color: AaxepTheme.darkGrey, fontSize: 12),
            labelStyle: TextStyle(fontSize: 12),
            errorStyle: TextStyle(color: AaxepTheme.red),
            contentPadding: EdgeInsets.all(8.0)),
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            titleTextStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'NotoSansDisplay', color: AaxepTheme.black),
            centerTitle: false,
            elevation: 1,
            shadowColor: AaxepTheme.lightGrey,
            actionsIconTheme: IconThemeData(color: AaxepTheme.black)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AaxepTheme.lightGrey,
            unselectedItemColor: AaxepTheme.darkGrey,
            selectedItemColor: AaxepTheme.primary),
        cardTheme: CardTheme(
            elevation: Dimension.elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimension.cardRadius),
            )),
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimension.cardRadius), topRight: Radius.circular(Dimension.cardRadius))),
        ),
        iconTheme: const IconThemeData(
          color: AaxepTheme.primary,
        ),
        chipTheme: base.chipTheme.copyWith(
            labelStyle: base.textTheme.headline5,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Dimension.labelRadius)))),
        snackBarTheme: base.snackBarTheme
            .copyWith(behavior: SnackBarBehavior.fixed, actionTextColor: AaxepTheme.white, elevation: 0),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AaxepTheme.primary,
          unselectedLabelColor: Colors.black54,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: AaxepTheme.primary, width: 3, style: BorderStyle.solid)),
        ));
  }
}
