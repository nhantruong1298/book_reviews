/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/account-icon.svg
  SvgGenImage get accountIcon =>
      const SvgGenImage('assets/images/account-icon.svg');

  /// File path: assets/images/dac-nhan-tam.png
  AssetGenImage get dacNhanTam =>
      const AssetGenImage('assets/images/dac-nhan-tam.png');

  /// File path: assets/images/email-icon.svg
  SvgGenImage get emailIcon =>
      const SvgGenImage('assets/images/email-icon.svg');

  /// File path: assets/images/event-icon.svg
  SvgGenImage get eventIcon =>
      const SvgGenImage('assets/images/event-icon.svg');

  /// File path: assets/images/facebook-icon.svg
  SvgGenImage get facebookIcon =>
      const SvgGenImage('assets/images/facebook-icon.svg');

  /// File path: assets/images/home-icon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/images/home-icon.svg');

  /// File path: assets/images/information-icon.svg
  SvgGenImage get informationIcon =>
      const SvgGenImage('assets/images/information-icon.svg');

  /// File path: assets/images/link-icon.svg
  SvgGenImage get linkIcon => const SvgGenImage('assets/images/link-icon.svg');

  /// File path: assets/images/linked-in-icon.svg
  SvgGenImage get linkedInIcon =>
      const SvgGenImage('assets/images/linked-in-icon.svg');

  /// File path: assets/images/logout-icon.svg
  SvgGenImage get logoutIcon =>
      const SvgGenImage('assets/images/logout-icon.svg');

  /// File path: assets/images/menu-icon.svg
  SvgGenImage get menuIcon => const SvgGenImage('assets/images/menu-icon.svg');

  /// File path: assets/images/moon-icon.svg
  SvgGenImage get moonIcon => const SvgGenImage('assets/images/moon-icon.svg');

  /// File path: assets/images/notification-icon.svg
  SvgGenImage get notificationIcon =>
      const SvgGenImage('assets/images/notification-icon.svg');

  /// File path: assets/images/order-icon.svg
  SvgGenImage get orderIcon =>
      const SvgGenImage('assets/images/order-icon.svg');

  /// File path: assets/images/profile-icon.svg
  SvgGenImage get profileIcon =>
      const SvgGenImage('assets/images/profile-icon.svg');

  /// File path: assets/images/search-icon.svg
  SvgGenImage get searchIcon =>
      const SvgGenImage('assets/images/search-icon.svg');

  /// File path: assets/images/setting-icon.svg
  SvgGenImage get settingIcon =>
      const SvgGenImage('assets/images/setting-icon.svg');

  /// File path: assets/images/twitter-icon.svg
  SvgGenImage get twitterIcon =>
      const SvgGenImage('assets/images/twitter-icon.svg');

  /// File path: assets/images/user-icon.svg
  SvgGenImage get userIcon => const SvgGenImage('assets/images/user-icon.svg');

  /// List of all assets
  List<dynamic> get values => [
        accountIcon,
        dacNhanTam,
        emailIcon,
        eventIcon,
        facebookIcon,
        homeIcon,
        informationIcon,
        linkIcon,
        linkedInIcon,
        logoutIcon,
        menuIcon,
        moonIcon,
        notificationIcon,
        orderIcon,
        profileIcon,
        searchIcon,
        settingIcon,
        twitterIcon,
        userIcon
      ];
}

class $AssetsMockDataGen {
  const $AssetsMockDataGen();

  /// File path: assets/mock_data/books_data.json
  String get booksData =>
      'packages/presentation/assets/mock_data/books_data.json';

  /// File path: assets/mock_data/events_data.json
  String get eventsData =>
      'packages/presentation/assets/mock_data/events_data.json';

  /// List of all assets
  List<String> get values => [booksData, eventsData];
}

class $AssetsRawsGen {
  const $AssetsRawsGen();

  /// File path: assets/raws/success_animation.json
  String get successAnimation =>
      'packages/presentation/assets/raws/success_animation.json';

  /// List of all assets
  List<String> get values => [successAnimation];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMockDataGen mockData = $AssetsMockDataGen();
  static const $AssetsRawsGen raws = $AssetsRawsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package = 'presentation',
    FilterQuality filterQuality = FilterQuality.low,
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
    String? package = 'presentation',
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/presentation/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package = 'presentation',
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      //colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/presentation/$_assetName';
}
