import 'package:flutter/material.dart';
import 'package:gluon_flutter_tech_test/resources/dimens.dart';

// Declare the color scheme here so that it can be used in the theme.
final _colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

final primaryTheme = ThemeData(
  colorScheme: _colorScheme,
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.unit8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.unit8),
      borderSide: BorderSide(color: _colorScheme.error),
    ),
    contentPadding: EdgeInsets.zero,
    errorStyle: TextStyle(color: _colorScheme.error),
  ),
);
