import 'package:movie_hub/core/usable_functions/firebase/firebase_handling.dart';

abstract interface class DrawerRemoteDataSourceInterface {
  Future<void> logOut();
}

final class DrawerRemoteDataSourceImpl
    implements DrawerRemoteDataSourceInterface {
  @override
  Future<void> logOut() async {
    await Authentication.logOut();
  }
}
