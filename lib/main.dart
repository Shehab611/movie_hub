import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'core/utils/app_constants/app_strings.dart';
import 'core/utils/app_routes_utils/app_router.dart';
import 'core/utils/design_utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppLanguage appLanguage = sl<AppLanguage>();
  static final AppTheme appTheme = sl<AppTheme>();

  @override
  Widget build(BuildContext context) {
    AppThemeData appThemeData = AppThemeData(
        AppTextTheme.createTextTheme(context, "Montserrat", "Raleway"));
    return ListenableBuilder(
        listenable: appTheme,
        builder: (context, snapshot) {
          return ListenableBuilder(
            listenable: appLanguage,
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.15),
                  ),
                  child: MaterialApp(
                    title: 'Movie Hub',
                    debugShowCheckedModeBanner: false,
                    routes: AppRouter.routes,
                    theme: appThemeData.lightTheme(),
                    darkTheme: appThemeData.darkTheme(),
                    themeMode: appTheme.themeMode,
                    initialRoute: AppPathName.kOpenScreen,
                    locale: appLanguage.appLocal,
                    supportedLocales: AppConstants.supportedLocales.values,
                    localizationsDelegates: AppConstants.delegates,
                  ));
            },
          );
        });
  }
}
