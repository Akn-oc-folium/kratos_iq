import 'package:flutter/foundation.dart';
import 'package:kratos_iq/gen/fonts.gen.dart';
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
          'card': kcGray100,
          'cardForeground': kcBlack,
          'popover': Colors.white,
          'popoverForeground': kcBlack,
          'primary': kcLime300,
          'primaryForeground': kcBlack,
          'secondary': kcLime300,
          'secondaryForeground': kcZinc900,
          'muted': Colors.gray[100],
          'mutedForeground': kcBlack,
          'accent': kcLime100,
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
      typography: Typography.geist(
        sans: const TextStyle(fontFamily: FontFamily.inter),
        mono: const TextStyle(fontFamily: FontFamily.inter),
        xSmall: const TextStyle(fontFamily: FontFamily.inter, fontSize: 12),
        small: const TextStyle(fontFamily: FontFamily.inter, fontSize: 14),
        base: const TextStyle(fontFamily: FontFamily.inter, fontSize: 16),
        large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 18),
        xLarge: const TextStyle(fontFamily: FontFamily.inter, fontSize: 20),
        x2Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 24),
        x3Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 30),
        x4Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 36),
        x5Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 48),
        x6Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 60),
        x7Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 72),
        x8Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 96),
        x9Large: const TextStyle(fontFamily: FontFamily.inter, fontSize: 144),
        thin: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w100),
        light: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w300),
        extraLight: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w200),
        normal: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w400),
        medium: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w500),
        semiBold: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w600),
        bold: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w700),
        extraBold: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w800),
        black: const TextStyle(
            fontFamily: FontFamily.inter, fontWeight: FontWeight.w900),
        italic: const TextStyle(
            fontFamily: FontFamily.inter, fontStyle: FontStyle.italic),
        h1: TextStyle(
          fontSize: 48,
          color: Colors.zinc[800],
          fontFamily: FontFamily.inter,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.2,
          height: 1,
        ),
        h2: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
        h3: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        h4: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        p: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        blockQuote: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        ),
        inlineCode: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        lead: const TextStyle(fontFamily: FontFamily.inter, fontSize: 20),
        textLarge: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        textSmall: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        textMuted: const TextStyle(
          fontFamily: FontFamily.inter,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      radius: 0.5,
      platform: TargetPlatform.macOS,
    );
  }
}
