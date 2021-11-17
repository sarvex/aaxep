import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

class AppRouter {
  AppRouter._();

  static const landingPageRoute = '/';
  static const introPageRoute = '/intro';
  static const homePageRoute = '/home';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final uriData = Uri.parse(settings.name ?? '');
  switch (uriData.path) {
    case AppRouter.homePageRoute:
      return _getPageRoute(const Home(), settings);
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) =>
    MaterialPageRoute(builder: (_) => child, settings: RouteSettings(name: settings.name));
