import 'package:cash_wallet/utils/app_routes.dart';
import 'package:cash_wallet/utils/constants.dart';
import 'package:cash_wallet/utils/keyboarddismissable/keyboard_dismissable.dart';
import 'package:cash_wallet/utils/resources.dart';
import 'package:cash_wallet/utils/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(supportedLocales: const [
    Locale('en'),
    Locale('he'),
  ], path: R.translationsPathPrefix, fallbackLocale: const Locale('en'), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KeyBoardDismissible(
        child: MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    ));
  }
}
