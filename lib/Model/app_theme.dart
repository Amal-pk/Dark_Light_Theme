import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ThemeModel {
  List<Color>? gradientColors;
  Color? switchColor;
  Color? thumbColor;
  Color? switchBgColor;
  ThemeModel({
    this.gradientColors,
    this.switchBgColor,
    this.switchColor,
    this.thumbColor,
  });
}
