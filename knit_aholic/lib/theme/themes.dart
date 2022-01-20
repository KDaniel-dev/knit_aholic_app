import 'package:flutter/material.dart';

enum Themes { teal, lightblue, orange, red, pink }

int getIntValue(Themes theme) {
  switch (theme) {
    case Themes.teal:
      return 0;
    case Themes.lightblue:
      return 1;
    case Themes.orange:
      return 2;
    case Themes.red:
      return 3;
    case Themes.pink:
      return 4;
  }
}

MaterialColor getColorValue(Themes theme) {
  switch (theme) {
    case Themes.teal:
      return Colors.teal;
    case Themes.lightblue:
      return Colors.lightBlue;
    case Themes.orange:
      return Colors.orange;
    case Themes.red:
      return Colors.red;
    case Themes.pink:
      return Colors.pink;
  }
}
