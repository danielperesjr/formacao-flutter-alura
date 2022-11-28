import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primaryColor: Colors.indigo,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.indigo,
  ).copyWith(
    secondary: Colors.indigo[400],
    surface: Colors.indigo[100],
  ),
  textTheme: TextTheme(
    displaySmall: TextStyle(
      color: Colors.black,
      fontSize: 24,
      overflow: TextOverflow.ellipsis,
    ),
  ),
  primaryTextTheme: TextTheme(
    labelLarge: TextStyle(
      fontSize: 16,
    ),
  ),
);
