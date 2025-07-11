/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ai_ethics.png
  AssetGenImage get aiEthics =>
      const AssetGenImage('assets/images/ai_ethics.png');

  /// File path: assets/images/celebration.png
  AssetGenImage get celebration =>
      const AssetGenImage('assets/images/celebration.png');

  /// File path: assets/images/create-flashcard-banner.png
  AssetGenImage get createFlashcardBanner =>
      const AssetGenImage('assets/images/create-flashcard-banner.png');

  /// File path: assets/images/design_fundamentals.png
  AssetGenImage get designFundamentals =>
      const AssetGenImage('assets/images/design_fundamentals.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/measurable-column.png
  AssetGenImage get measurableColumn =>
      const AssetGenImage('assets/images/measurable-column.png');

  /// File path: assets/images/set_theory.png
  AssetGenImage get setTheory =>
      const AssetGenImage('assets/images/set_theory.png');

  /// File path: assets/images/student-qa.png
  AssetGenImage get studentQa =>
      const AssetGenImage('assets/images/student-qa.png');

  /// File path: assets/images/timetable.png
  AssetGenImage get timetable =>
      const AssetGenImage('assets/images/timetable.png');

  /// File path: assets/images/vector_spaces.png
  AssetGenImage get vectorSpaces =>
      const AssetGenImage('assets/images/vector_spaces.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        aiEthics,
        celebration,
        createFlashcardBanner,
        designFundamentals,
        logo,
        measurableColumn,
        setTheory,
        studentQa,
        timetable,
        vectorSpaces
      ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
