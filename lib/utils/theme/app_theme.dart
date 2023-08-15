import 'package:cash_wallet/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme(BuildContext context, Brightness brightness) => ThemeData(
        useMaterial3: true,
        brightness: brightness,
        // colorScheme: scheme(brightness),
        colorSchemeSeed: const Color(0xFFDB23C1),
        appBarTheme: const AppBarTheme(centerTitle: true),
        // textTheme: textTheme(context, brightness, myBlue, 'NotoSans'),
        fontFamily: "Poppins",
        expansionTileTheme: const ExpansionTileThemeData(shape: RoundedRectangleBorder(side: BorderSide.none)),
        cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(borderRadius: BorderRadius.circular(26));
          }),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((_) {
            return const EdgeInsets.symmetric(vertical: 14, horizontal: 14);
          }),
          alignment: AlignmentDirectional.center,
        )),
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(borderRadius: BorderRadius.circular(26));
          }),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((_) {
            return const EdgeInsets.symmetric(vertical: 16, horizontal: 16);
          }),
          alignment: AlignmentDirectional.center,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
            return RoundedRectangleBorder(borderRadius: BorderRadius.circular(26));
          }),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((_) {
            return const EdgeInsets.symmetric(vertical: 16, horizontal: 16);
          }),
          alignment: AlignmentDirectional.center,
        )),
        listTileTheme: ListTileThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        inputDecorationTheme: const InputDecorationTheme(isDense: true),
      );

  static ColorScheme scheme(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return const ColorScheme.light();
      default:
        return const ColorScheme.dark();
    }
  }

  static ThemeData lightTheme(BuildContext context) => theme(context, Brightness.light);
  static ThemeData darkTheme(BuildContext context) {
    final darkTheme = theme(context, Brightness.dark);
    final darkThemeSchame = darkTheme.colorScheme.copyWith(background: AppColors.pageBackground);
    return darkTheme.copyWith(colorScheme: darkThemeSchame, scaffoldBackgroundColor: AppColors.pageBackground, cardTheme: const CardTheme(color: AppColors.cardBackground));
  }
}
