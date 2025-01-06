import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,
  fontFamily: 'w600',
  scaffoldBackgroundColor: Color(0xff222427),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(14)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: 'w600',
      color: Colors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: 'w600',
    ),
  ),
);
