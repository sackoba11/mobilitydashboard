import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'i_app_color.dart';

@Singleton(as: IAppColor)
class DefaultAppColor implements IAppColor {
  @override
  Color primary = const Color(0xff263238);

  @override
  Color get lightPrimary => const Color(0xFF263238).withOpacity(0.2);

  @override
  Color black = const Color(0xff030115);

  @override
  Color white = const Color(0xFFFFFFFF);

  @override
  Color gray = const Color(0xFFE5E5ED);

  @override
  Color get red => const Color(0xFFD3150F);

  @override
  Color get background => const Color(0xff171821);

  @override
  Color get secondary => const Color(0xFF21222d);

  @override
  Color get sideBarItemBackground => const Color(0xFFa9dfd8);

  @override
  Color get textColor => const Color(0xFF858687);
}
