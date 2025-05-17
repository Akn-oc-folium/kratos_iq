import 'package:flutter/foundation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AppThemes {
  AppThemes._();

  static ThemeData getTheme() {
    return ThemeData(
        colorScheme: ColorScheme.fromColors(
            colors: {'background': Colors.white}, brightness: Brightness.light),
        radius: 0.5);
  }
}
