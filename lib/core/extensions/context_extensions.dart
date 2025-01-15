import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/color/default_app_color.dart';
import '../theme/color/i_app_color.dart';
import '../theme/gaps/default_app_gaps.dart';
import '../theme/gaps/i_app_gaps.dart';

extension ThemeExtensions on BuildContext {
  static IAppColor iAppColor = DefaultAppColor();
  static IAppGaps gap = DefaultAppGaps();

  /// Get colors
  IAppColor get colors {
    return iAppColor;
  }

  /// Get gaps
  IAppGaps get gaps {
    return gap;
  }

  Widget get loader {
    return Center(
      child: CircularProgressIndicator(
        color: colors.primary,
      ),
    );
  }

  // void showSnackbar(
  //     {required BuildContext context,
  //     String? title,
  //     String? message,
  //     Duration? duration,
  //     EdgeInsets? padding,
  //     bool? isError}) {
  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       padding:
  //           padding ?? EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
  //       backgroundColor: context.colors.background,
  //       duration: duration ?? const Duration(seconds: 4),
  //       content: CustomSnackar(
  //           description: message, title: title, isError: isError ?? false)));
  // }

  void overlayStyle({Color? color, Color? statusColor, Brightness? brigtness}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: color ?? colors.primary,
        statusBarIconBrightness: brigtness,
        statusBarColor: statusColor));
  }
}
