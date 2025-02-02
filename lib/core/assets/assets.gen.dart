/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/IBMPlexSans-Bold.ttf
  String get iBMPlexSansBold => 'assets/fonts/IBMPlexSans-Bold.ttf';

  /// File path: assets/fonts/IBMPlexSans-ExtraLight.ttf
  String get iBMPlexSansExtraLight => 'assets/fonts/IBMPlexSans-ExtraLight.ttf';

  /// File path: assets/fonts/IBMPlexSans-Italic.ttf
  String get iBMPlexSansItalic => 'assets/fonts/IBMPlexSans-Italic.ttf';

  /// File path: assets/fonts/IBMPlexSans-Light.ttf
  String get iBMPlexSansLight => 'assets/fonts/IBMPlexSans-Light.ttf';

  /// File path: assets/fonts/IBMPlexSans-Medium.ttf
  String get iBMPlexSansMedium => 'assets/fonts/IBMPlexSans-Medium.ttf';

  /// File path: assets/fonts/IBMPlexSans-Regular.ttf
  String get iBMPlexSansRegular => 'assets/fonts/IBMPlexSans-Regular.ttf';

  /// File path: assets/fonts/IBMPlexSans-SemiBold.ttf
  String get iBMPlexSansSemiBold => 'assets/fonts/IBMPlexSans-SemiBold.ttf';

  /// File path: assets/fonts/IBMPlexSans-Thin.ttf
  String get iBMPlexSansThin => 'assets/fonts/IBMPlexSans-Thin.ttf';

  /// List of all assets
  List<String> get values => [
        iBMPlexSansBold,
        iBMPlexSansExtraLight,
        iBMPlexSansItalic,
        iBMPlexSansLight,
        iBMPlexSansMedium,
        iBMPlexSansRegular,
        iBMPlexSansSemiBold,
        iBMPlexSansThin
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/add-row.svg
  SvgGenImage get addRow => const SvgGenImage('assets/svg/add-row.svg');

  /// File path: assets/svg/bus-stop-pointer.svg
  SvgGenImage get busStopPointer =>
      const SvgGenImage('assets/svg/bus-stop-pointer.svg');

  /// File path: assets/svg/bus1.svg
  SvgGenImage get bus1 => const SvgGenImage('assets/svg/bus1.svg');

  /// File path: assets/svg/chauffer.svg
  SvgGenImage get chauffer => const SvgGenImage('assets/svg/chauffer.svg');

  /// File path: assets/svg/dashboard2.svg
  SvgGenImage get dashboard2 => const SvgGenImage('assets/svg/dashboard2.svg');

  /// File path: assets/svg/delete-button.svg
  SvgGenImage get deleteButton =>
      const SvgGenImage('assets/svg/delete-button.svg');

  /// File path: assets/svg/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/svg/filter.svg');

  /// File path: assets/svg/filter1.svg
  SvgGenImage get filter1 => const SvgGenImage('assets/svg/filter1.svg');

  /// File path: assets/svg/filter2.svg
  SvgGenImage get filter2 => const SvgGenImage('assets/svg/filter2.svg');

  /// File path: assets/svg/left-arrow.svg
  SvgGenImage get leftArrow => const SvgGenImage('assets/svg/left-arrow.svg');

  /// File path: assets/svg/logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/svg/logout.svg');

  /// File path: assets/svg/logout1.svg
  SvgGenImage get logout1 => const SvgGenImage('assets/svg/logout1.svg');

  /// File path: assets/svg/menu-vertical1.svg
  SvgGenImage get menuVertical1 =>
      const SvgGenImage('assets/svg/menu-vertical1.svg');

  /// File path: assets/svg/refresh-cw-alt.svg
  SvgGenImage get refreshCwAlt =>
      const SvgGenImage('assets/svg/refresh-cw-alt.svg');

  /// File path: assets/svg/refresh-cw.svg
  SvgGenImage get refreshCw => const SvgGenImage('assets/svg/refresh-cw.svg');

  /// File path: assets/svg/refresh.svg
  SvgGenImage get refresh => const SvgGenImage('assets/svg/refresh.svg');

  /// File path: assets/svg/refresh1.svg
  SvgGenImage get refresh1 => const SvgGenImage('assets/svg/refresh1.svg');

  /// File path: assets/svg/right-arrow.svg
  SvgGenImage get rightArrow => const SvgGenImage('assets/svg/right-arrow.svg');

  /// File path: assets/svg/table-add.svg
  SvgGenImage get tableAdd => const SvgGenImage('assets/svg/table-add.svg');

  /// File path: assets/svg/users-user.svg
  SvgGenImage get usersUser => const SvgGenImage('assets/svg/users-user.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        addRow,
        busStopPointer,
        bus1,
        chauffer,
        dashboard2,
        deleteButton,
        filter,
        filter1,
        filter2,
        leftArrow,
        logout,
        logout1,
        menuVertical1,
        refreshCwAlt,
        refreshCw,
        refresh,
        refresh1,
        rightArrow,
        tableAdd,
        usersUser
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
