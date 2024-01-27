
import 'package:flutter/material.dart';
import 'package:whatsapp_new_ui/features/app/theme/style.dart';

final appDarTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
      seedColor: tabColor,
      brightness: Brightness.dark
  ),
  scaffoldBackgroundColor: backgroundColor,
  dialogBackgroundColor: appBarColor,
  appBarTheme: const AppBarTheme(
    color: appBarColor,
  ),
);