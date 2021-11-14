import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_router.dart';
import 'config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aaxep',
        color: AaxepTheme.primary,
        theme: AaxepTheme.lightTheme,
        navigatorKey: navigator,
        navigatorObservers: [],
        onGenerateRoute: generateRoute,
        initialRoute: AppRouter.homePageRoute);
  }
}
