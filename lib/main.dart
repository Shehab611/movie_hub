import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/service_locator.dart';
import 'core/utils/app_constants/app_strings.dart';
import 'core/utils/app_routes_utils/app_router.dart';
import 'core/utils/app_routes_utils/route_checker.dart';
import 'core/utils/design_utils/app_theme.dart';
import 'firebase_options.dart';
import 'obs.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await initServicesLocator();
  await sl<AppLanguage>().fetchLocale();
  await sl<AppTheme>().fetchTheme();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Semantics(
    key: const Key('Movie Hub Semantic Key'),
    label: 'Movie Hub App',
    child: const MyApp(
      key: Key('Movie Hub Key'),
    ),
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
                    textScaler: const TextScaler.linear(1.1),
                  ),
                  child: MaterialApp(
                    key: Key('Material App  $key'),
                    title: 'Movie Hub',
                    // showSemanticsDebugger: true,
                    debugShowCheckedModeBanner: false,
                    routes: AppRouter.routes,
                    theme: appThemeData.lightTheme(),
                    darkTheme: appThemeData.darkTheme(),
                    themeMode: appTheme.themeMode,
                    initialRoute: RouteChecker.checkRoutes(),
                    locale: appLanguage.appLocale,
                    supportedLocales: AppConstants.supportedLocales.values,
                    localizationsDelegates: AppConstants.delegates,
                  ));
            },
          );
        });
  }
}
