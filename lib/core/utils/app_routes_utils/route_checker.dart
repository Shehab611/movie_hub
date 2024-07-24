import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';

sealed class Route {
  late String _routePath;
  late bool _go;

  set routePath(String path) => _routePath = path;

  set go(bool path) => _go = path;
}

class OpenScreenRoute extends Route {
  @override
  String get _routePath => AppPathName.kOpenScreen;

  @override
  bool get _go => sl.get<FirebaseAuth>().currentUser == null;
}

class EmailVerificationRoute extends Route {
  @override
  String get _routePath => AppPathName.kEmailVerificationScreen;

  @override
  bool get _go => !sl.get<FirebaseAuth>().currentUser!.emailVerified;
}

class HomeRoute extends Route {
  @override
  String get _routePath => AppPathName.kHomeScreen;

  @override
  bool get _go =>
      sl.get<FirebaseAuth>().currentUser!.emailVerified &&
      sl.get<FirebaseAuth>().currentUser != null;
}

class RouteChecker {
  static bool _checkRoutes(Route route) {
    return route._go;
  }

  static String checkRoutes() {
    List<Route> routes = [
      OpenScreenRoute(),
      EmailVerificationRoute(),
      HomeRoute(),
    ];
    for (var route in routes) {
      if (_checkRoutes(route)) {
        return route._routePath;
      }
    }

    throw UnimplementedError();
  }
}
