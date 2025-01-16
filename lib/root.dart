import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/router.dart';

import 'providers.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: ScreenUtilInit(
        designSize: const Size(1440, 1024),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            primaryColor: context.colors.primary,
            fontFamily: 'IBMPlexSans',
            brightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
