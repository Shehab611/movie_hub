import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/shared/use_cases/logout_use_case.dart';
import 'package:movie_hub/core/usable_functions/encryption.dart';
import 'package:movie_hub/core/utils/api_utils/data_response.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';

part 'drawer_state.dart';

typedef TileData = ({IconData icon, String title, String routePath});

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(this._drawerUseCase) : super(const DrawerInitial());

  //#region Private Variables

  final List<TileData> _tileData = const [
    (
      icon: Icons.home,
      title: AppStrings.homeScreen,
      routePath: AppPathName.kHomeScreen
    ),
    (
      icon: Icons.person,
      title: AppStrings.profileScreen,
      routePath: AppPathName.kProfileScreen
    ),
    (
      icon: Icons.logout,
      title: AppStrings.logout,
      routePath: AppPathName.kOpenScreen
    ),
  ];

  Locale _languageValue =
      AppConstants.supportedLocales[sl<AppLanguage>().appLocale.languageCode]!;

  final List<Locale> _languages = AppConstants.supportedLocales.values.toList();

  final Duration _animationDuration = const Duration(milliseconds: 350);

  final Duration _animationDelayDuration = const Duration(milliseconds: 200);

  final bool _isEnglish = sl.get<AppLanguage>().appLocale == const Locale('en');

  final int _extraLength = 2;

  final User _user = sl.get<FirebaseAuth>().currentUser!;

  final LogoutUseCase _drawerUseCase;

  //#endregion

  //#region Getters
  Locale get languageValue => _languageValue;

  List<Locale> get languages => _languages;

  List<TileData> get tileData => _tileData;

  Duration get animationDuration => _animationDuration;

  bool get isEnglish => _isEnglish;

  int get extraLength => _extraLength;

  User get user => _user;

//#endregion

  //#region Public Methods
  void changeLocale(Locale? locale) {
    sl<AppLanguage>().changeLanguage(locale!);
    _languageValue = locale;
  }

  void changeTheme() {
    var appTheme = sl<AppTheme>();
    if (appTheme.themeMode == ThemeMode.system) {
      var brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;
      if (isDarkMode) {
        appTheme.changeTheme(ThemeMode.light);
      } else {
        appTheme.changeTheme(ThemeMode.dark);
      }
    } else if (appTheme.themeMode == ThemeMode.light) {
      appTheme.changeTheme(ThemeMode.dark);
    } else {
      appTheme.changeTheme(ThemeMode.light);
    }
  }

  Duration animationDelayDuration(index) {
    return _animationDelayDuration * (index / 5);
  }

  Future<void> logOut() async {
    await _drawerUseCase.call(const NoParameters());
  }

  String getUserName() {
    List<String> names = _user.displayName!.split(' ');
    String firstName = sl.get<EncryptionService>().decrypt(names.first);
    String lastName = sl.get<EncryptionService>().decrypt(names.last);
    return '$firstName $lastName';
  }
//#endregion
}
