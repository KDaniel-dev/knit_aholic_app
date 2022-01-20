import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/theme_model.dart';
import 'themes.dart';

class ThemeChanger extends StatefulWidget {
  final ThemeModel themeModel;
  final Themes theme;
  const ThemeChanger({required Themes theme, required ThemeModel themeModel})
      : theme = theme,
        themeModel = themeModel;

  @override
  ThemeChangerState createState() => ThemeChangerState(theme, themeModel);
}

class ThemeChangerState extends State<ThemeChanger> {
  ThemeChangerState(this.theme, this.themeModel);
  final Themes theme;
  final ThemeModel themeModel;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 30,
      height: 30,
      decoration: ShapeDecoration(
        color: getColorValue(theme),
        shape: const CircleBorder(
          side: BorderSide(width: 2, color: Colors.black),
        ),
      ),
      child: IconButton(
        iconSize: 0,
        splashRadius: 25,
        icon: const Icon(Icons.android),
        color: Colors.white,
        onPressed: () {
          themeModel.setTheme = getIntValue(theme);
        },
      ),
    );
  }
}
