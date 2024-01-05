import 'package:flutter/material.dart';
import 'package:task_app/product/constants/color_constants.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.grey,
      ),
      dividerTheme: const DividerThemeData(
        color: ColorConstants.darkPurple,
      ),
      useMaterial3: true,
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        // backgroundColor: Colors.grey,
        backgroundColor: ColorConstants.lightPurple,
        foregroundColor: Colors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorConstants.purple,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      cardColor: Color(0xffAAD7D9),
      useMaterial3: true,
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      // brightness: Brightness.light,
      dividerTheme: const DividerThemeData(
        color: ColorConstants.darkPurple,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFE5E5E5),
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        // backgroundColor: Colors.grey,
        backgroundColor: Color(0xff769FCD),
        foregroundColor: Colors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        // backgroundColor: Colors.grey,
        backgroundColor: Color(0xff769FCD),

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
    ),
  };
}
