import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobilitydashboard/core/extensions/context_extensions.dart';
import 'package:mobilitydashboard/router.dart';
import 'package:paged_datatable/l10n/generated/l10n.dart';

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
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            PagedDataTableLocalization.delegate
          ],
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: context.colors.primary,
            fontFamily: 'IBMPlexSans',
            brightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
