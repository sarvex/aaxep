import 'package:aaxep/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';

import 'app_router.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  runApp(const Aaxep());
}

class Aaxep extends StatelessWidget {
  const Aaxep({Key? key}) : super(key: key);

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
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        onGenerateRoute: generateRoute,
        initialRoute: AppRouter.homePageRoute);
  }
}
