import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: 'CustomFont', fontSize: 18, fontWeight: FontWeight.bold,color: CustomColors.darkCoffee),
        bodySmall: TextStyle(fontFamily: 'CustomFont', fontSize: 18, fontWeight: FontWeight.normal,color: CustomColors.darkCoffee),
        displayLarge: TextStyle(fontFamily: 'CustomFont', fontSize: 32, fontWeight: FontWeight.bold, color: CustomColors.choco),
        displayMedium: TextStyle(fontFamily: 'CustomFont', fontSize: 18, fontWeight: FontWeight.bold,color: CustomColors.choco),
        titleLarge: TextStyle(fontFamily: 'CustomFont', fontSize: 25, fontWeight: FontWeight.bold, color: CustomColors.choco),
        titleMedium: TextStyle(fontFamily: 'CustomFont', fontSize: 20, fontWeight:FontWeight.bold, color: CustomColors.choco),
        titleSmall: TextStyle(fontFamily: 'CustomFont', fontSize: 20, color: CustomColors.choco),
        labelLarge: TextStyle(fontFamily: 'CustomFont', fontSize: 24, color: CustomColors.greenGrass, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.primary,
        titleTextStyle: TextStyle(fontFamily: 'CustomFont', fontSize: 25, fontWeight: FontWeight.bold, color: CustomColors.darkCoffee),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: CustomColors.golden, backgroundColor: CustomColors.greenGrass, textStyle: const TextStyle(
            fontFamily: 'CustomFont',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: CustomColors.golden,
        backgroundColor: CustomColors.greenGrass,
      )
    );
  }
}

class CustomColors{
  static const Color golden = Color.fromARGB(255, 255, 230, 0);
  static const Color primary =  Color.fromARGB(255, 238, 154, 073);
  static const Color greenGrass =  Color.fromARGB(180, 134, 179, 0);
  static const Color choco = Color.fromARGB(255, 102, 51, 0);
  static const Color darkCoffee = Color.fromARGB(255, 51, 26, 0);
}