import 'package:flutter/foundation.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AppThemes {
  AppThemes._();

  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromColors(
        colors: {
          'background': Colors.white,
          'foreground': Colors.black,
          'card': kcGrey,
          'cardForeground': Colors.black,
          'popover': Colors.white,
          'popoverForeground': Colors.black,
          'primary': kcLime264,
          'primaryForeground': Colors.black,
          'secondary': kcLime30D,
          'secondaryForeground': kcLime314,
          'muted': Colors.white,
          'mutedForeground': Colors.black,
          'accent': kcLimeC16,
          'accentForeground': Colors.black,
          'destructive': Colors.red[500],
          'destructiveForeground': Colors.white,
          'border': kcBlack,
          'input': kcBlack,
          'ring': kcBlack,
          'chart1': const Color(0xFFFDF4FF),
          'chart2': kcBlack,
          'chart3': Colors.fuchsia[400],
          'chart4': const Color(0xFF7F56D9),
          'chart5': const Color(0xFF7F56D9).withValues(alpha: 0),
        },
        brightness: Brightness.light,
      ),
      typography: const Typography.geist(
        sans: TextStyle(fontFamily: 'Inter'),
      ),
      radius: 0.5,
      platform: TargetPlatform.macOS,
    );
  }
}
