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
          'foreground': kcBlack,
          'card': kcGrey,
          'cardForeground': kcBlack,
          'popover': Colors.white,
          'popoverForeground': kcBlack,
          'primary': kcBlack,
          'primaryForeground': kcBlack,
          'secondary': kcLime264,
          'secondaryForeground': kcLime314,
          'muted': Colors.white,
          'mutedForeground': kcBlack,
          'accent': kcLimeC16,
          'accentForeground': kcBlack,
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
