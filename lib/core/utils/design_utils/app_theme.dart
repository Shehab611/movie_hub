import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_sizes.dart';
part 'app_text_theme.dart';

final class AppThemeData {
  final TextTheme textTheme;

  const AppThemeData(this.textTheme);

  ThemeData _theme(ColorScheme colorScheme) => ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      visualDensity: const VisualDensity(
          horizontal: -2, vertical: VisualDensity.maximumDensity),
      inputDecorationTheme: InputDecorationTheme(
        alignLabelWithHint: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.paddingSizeEight),
            borderSide: const BorderSide(
              width: .75,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.paddingSizeEight),
            borderSide: const BorderSide(
              width: .75,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.paddingSizeEight),
            borderSide: const BorderSide(
              width: .75,
            )),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingSizeDefault,
            vertical: AppSizes.paddingSizeEight),
      ));

  static ColorScheme _lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004ca7),
      surfaceTint: Color(0xff005ac2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff006fed),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff445e91),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffb6ccff),
      onSecondaryContainer: Color(0xff1d396a),
      tertiary: Color(0xff00576e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff347d96),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff181b23),
      onSurfaceVariant: Color(0xff414754),
      outline: Color(0xff727786),
      outlineVariant: Color(0xffc1c6d7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3038),
      inversePrimary: Color(0xffaec6ff),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff001a42),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff004395),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff2b4678),
      tertiaryFixed: Color(0xffbaeaff),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xff8cd0ec),
      onTertiaryFixedVariant: Color(0xff004d62),
      surfaceDim: Color(0xffd8d9e4),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fe),
      surfaceContainer: Color(0xffecedf8),
      surfaceContainerHigh: Color(0xffe6e8f2),
      surfaceContainerHighest: Color(0xffe0e2ed),
    );
  }

  ThemeData lightTheme() {
    return _theme(_lightScheme());
  }

  static ColorScheme _darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaec6ff),
      surfaceTint: Color(0xffaec6ff),
      onPrimary: Color(0xff002e6a),
      primaryContainer: Color(0xff006be4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffaec6ff),
      onSecondary: Color(0xff112f60),
      secondaryContainer: Color(0xff213c6e),
      onSecondaryContainer: Color(0xffbed1ff),
      tertiary: Color(0xff8cd0ec),
      onTertiary: Color(0xff003544),
      tertiaryContainer: Color(0xff347d96),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff10131b),
      onSurface: Color(0xffe0e2ed),
      onSurfaceVariant: Color(0xffc1c6d7),
      outline: Color(0xff8b90a0),
      outlineVariant: Color(0xff414754),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ed),
      inversePrimary: Color(0xff005ac2),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff001a42),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff004395),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff2b4678),
      tertiaryFixed: Color(0xffbaeaff),
      onTertiaryFixed: Color(0xff001f29),
      tertiaryFixedDim: Color(0xff8cd0ec),
      onTertiaryFixedVariant: Color(0xff004d62),
      surfaceDim: Color(0xff10131b),
      surfaceBright: Color(0xff363941),
      surfaceContainerLowest: Color(0xff0b0e15),
      surfaceContainerLow: Color(0xff181b23),
      surfaceContainer: Color(0xff1c2027),
      surfaceContainerHigh: Color(0xff272a32),
      surfaceContainerHighest: Color(0xff32353d),
    );
  }

  ThemeData darkTheme() {
    return _theme(_darkScheme());
  }
}

final class AppTheme extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Default to system theme

  ThemeMode get themeMode => _themeMode;

  Future<void> fetchTheme() async {
    var prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('theme_mode');
    if (themeString == null) {
      _themeMode = ThemeMode.system; // Default if no preference is stored
      await prefs.setString('theme_mode', 'system');
    } else {
      _themeMode = _getThemeModeFromString(themeString);
    }
  }

  void changeTheme(ThemeMode themeMode) async {
    var prefs = await SharedPreferences.getInstance();
    if (_themeMode == themeMode) {
      return; // No change needed
    } else {
      _themeMode = themeMode;
      await prefs.setString('theme_mode', _themeModeToString(themeMode));
    }
    notifyListeners();
  }

  // Helper methods for converting between ThemeMode and String
  ThemeMode _getThemeModeFromString(String themeString) {
    switch (themeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }
}
