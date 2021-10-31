import 'package:flutter/material.dart';

import 'colors.dart';
import 'constants.dart';

final ThemeData kAaxepLightTheme = _buildAaxepLightTheme();

ThemeData _buildAaxepLightTheme() {
  final base = ThemeData.light();
  return base.copyWith(
      brightness: Brightness.dark,
      primaryColor: kAaxepPrimary,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kAaxepPrimary,
        colorScheme: base.colorScheme.copyWith(primary: kAaxepPrimary),
        disabledColor: kAaxepLightGray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      ),
      buttonBarTheme: base.buttonBarTheme.copyWith(
        buttonTextTheme: ButtonTextTheme.accent,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: kAaxepPrimary, // background
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)))),
      scaffoldBackgroundColor: kAaxepBackground,
      errorColor: kAaxepDarkGray,
      // textTheme: _buildAaxepLightTextTheme(base.textTheme),
      // primaryTextTheme: _buildAaxepLightTextTheme(base.primaryTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: kAaxepPrimary),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(kInputRadius)), borderSide: BorderSide(color: kAaxepLightGray)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(kInputRadius)), borderSide: BorderSide(color: kAaxepLightGray)),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(color: kAaxepDarkGray, fontSize: 12),
          labelStyle: TextStyle(fontSize: 12),
          errorStyle: TextStyle(color: kAaxepRed),
          contentPadding: EdgeInsets.all(8.0)),
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'NotoSansDisplay', color: kAaxepBlack),
          centerTitle: false,
          elevation: 1,
          shadowColor: kAaxepLightGray,
          actionsIconTheme: IconThemeData(color: kAaxepBlack)),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: kAaxepLightGray, unselectedItemColor: kAaxepDarkGray, selectedItemColor: kAaxepPrimary),
      cardTheme: CardTheme(
          elevation: kElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kCardRadius),
          )),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(kCardRadius), topRight: Radius.circular(kCardRadius))),
      ),
      iconTheme: const IconThemeData(
        color: kAaxepPrimary,
      ),
      chipTheme: base.chipTheme.copyWith(
          labelStyle: base.textTheme.headline5, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(kLabelRadius)))),
      snackBarTheme: base.snackBarTheme.copyWith(behavior: SnackBarBehavior.fixed, actionTextColor: kAaxepWhite, elevation: 0),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: kAaxepPrimary,
        unselectedLabelColor: Colors.black54,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        indicator: UnderlineTabIndicator(borderSide: BorderSide(color: kAaxepPrimary, width: 3, style: BorderStyle.solid)),
      ));
}
