import 'package:flutter/material.dart';

import 'core/service_locator.dart';
import 'core/utils/app_constants/app_strings.dart';
import 'core/utils/app_routes_utils/app_router.dart';
import 'core/utils/design_utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServicesLocator();
  await sl<AppLanguage>().fetchLocale();
  await sl<AppTheme>().fetchTheme();
  runApp(const MyApp(
    key: Key('Movie Hub Key'),
  ));
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
                  key: Key('Media Query App $key'),
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.15),
                  ),
                  child: MaterialApp(
                    key: Key('Material App  $key'),
                    restorationScopeId: AppRestorationIds.rootId,
                    title: 'Movie Hub',
                    debugShowCheckedModeBanner: false,
                    routes: AppRouter.routes,
                    theme: appThemeData.lightTheme(),
                    darkTheme: appThemeData.darkTheme(),
                    themeMode: ThemeMode.light,
                    //appTheme.themeMode
                    initialRoute: AppPathName.kOpenScreen,
                    locale: appLanguage.appLocale,
                    supportedLocales: AppConstants.supportedLocales.values,
                    localizationsDelegates: AppConstants.delegates,
                  ));
            },
          );
        });
  }
}
