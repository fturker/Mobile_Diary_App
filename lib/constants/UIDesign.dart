import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIDesign {
  static Set<String> themes = {"darkTheme"};

  ///DARK TEMA
  static Map<String, dynamic> darkTheme = {
    "back_ground_color": const Color(0xFF292929),
    "bottom_navigation_bar_color": const Color(0xFF202359),
    "text_color": const Color(0xFFFFFFFF),
  };

  static Color getBackGroundColor(String theme) {
    if (themes.contains(theme)) {
      return _backGround(theme);
    } else {
      debugPrint("Error 01 :: Theme Bulunamadı");
      return Colors.white;
    }
  }

  static Color _backGround(String theme) {
    switch (theme) {
      case "darkTheme":
        return darkTheme["back_ground_color"];
      default:
        return Colors.lightBlueAccent;
    }
  }

  static EdgeInsets defaultTitlePadding() {
    return EdgeInsets.only(left: 10.w, top: 10.h);
  }

  static Color getBottomNavigationBarColor(String theme) {
    if (themes.contains(theme)) {
      return _bottomNavigationBar(theme);
    } else {
      return Colors.white;
    }
  }

  static Color _bottomNavigationBar(String theme) {
    switch (theme) {
      case "darkTheme":
        return darkTheme["bottom_navigation_bar_color"];
      default:
        return Colors.lightBlueAccent;
    }
  }
}
