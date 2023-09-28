import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:light_/Constant/colors.dart';
import 'package:light_/Constant/constant.dart';
import 'package:light_/Model/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isLigthTheme;
  ThemeProvider({required this.isLigthTheme});

  getCurrentstatusNavigationBarColor() {
    if (isLigthTheme) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.navColor,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  toggleThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isLigthTheme) {
      sharedPreferences.setBool(SPref.isLight, false);
      isLigthTheme = !isLigthTheme;
      notifyListeners();
    } else {
      sharedPreferences.setBool(SPref.isLight, true);
      isLigthTheme = !isLigthTheme;
      notifyListeners();
    }
    getCurrentstatusNavigationBarColor();
    notifyListeners();
  }

  ThemeData themeData() {
    return ThemeData(
      brightness: isLigthTheme ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor:
          isLigthTheme ? AppColors.orange : AppColors.black,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.stickNoBills(
          fontSize: 70,
          fontWeight: FontWeight.w600,
          color: isLigthTheme ? AppColors.black : AppColors.orange,
        ),
      ),
    );
  }

  ThemeModel themeModel() {
    return ThemeModel(
      gradientColors: isLigthTheme
          ? [AppColors.orange, AppColors.red]
          : [AppColors.black, AppColors.black],
      switchColor: isLigthTheme ? AppColors.black : AppColors.orange,
      thumbColor: isLigthTheme ? AppColors.orange : AppColors.black,
      switchBgColor: isLigthTheme
          ? AppColors.black.withOpacity(0.1)
          : AppColors.grey.withOpacity(0.3),
    );
  }
}
