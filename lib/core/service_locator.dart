import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_hub/core/usable_functions/api/api_service_helper.dart';
import 'package:movie_hub/core/usable_functions/encryption.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/authentication/forget_password/data/repositories/forget_password_repository.dart';
import 'package:movie_hub/features/authentication/forget_password/data/sources/forget_password_remote_data_source.dart';
import 'package:movie_hub/features/authentication/forget_password/domain/repositories/forget_password_repository_interface.dart';
import 'package:movie_hub/features/authentication/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:movie_hub/features/authentication/login/data/repositories/login_repository.dart';
import 'package:movie_hub/features/authentication/login/data/sources/login_remote_data_source.dart';
import 'package:movie_hub/features/authentication/login/domain/repositories/login_repository_interface.dart';
import 'package:movie_hub/features/authentication/login/domain/use_cases/login_use_case.dart';
import 'package:movie_hub/features/authentication/register/data/repositories/register_repository.dart';
import 'package:movie_hub/features/authentication/register/data/sources/register_remote_data_source.dart';
import 'package:movie_hub/features/authentication/register/domain/repositories/register_repository_interface.dart';
import 'package:movie_hub/features/authentication/register/domain/use_cases/register_use_case.dart';
import 'package:movie_hub/features/authentication/shared/data_repositories/email_verification_repository.dart';
import 'package:movie_hub/features/authentication/shared/data_repositories/social_apps_sign_in_repository.dart';
import 'package:movie_hub/features/authentication/shared/data_sources/email_verification_remote_data_source.dart';
import 'package:movie_hub/features/authentication/shared/data_sources/social_apps_sign_in_remote_data_source.dart';
import 'package:movie_hub/features/authentication/shared/domain_repositories/email_verification_interface.dart';
import 'package:movie_hub/features/authentication/shared/domain_repositories/social_apps_sign_in_interface.dart';
import 'package:movie_hub/features/authentication/shared/use_cases/email_verification_use_case.dart';
import 'package:movie_hub/features/authentication/shared/use_cases/google_sign_in.dart';
import 'package:movie_hub/features/drawer/data/repositories/drawer_repository.dart';
import 'package:movie_hub/features/drawer/data/sources/drawer_remote_data_source.dart';
import 'package:movie_hub/features/drawer/domain/repositories/drawer_repository_interface.dart';
import 'package:movie_hub/features/drawer/domain/use_cases/drawer_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  //#region Core
  sl.registerLazySingleton<DioClient>(() =>
      DioClient(ApiEndPoints.baseUrl, sl.get(), loggingInterceptor: sl.get()));
  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton<ApiResponseHandler>(
      () => ApiResponseHandler(sl.get()));
  sl.registerLazySingleton<EncryptionService>(() => EncryptionService(
      sl.get(), IV.fromBase64(const String.fromEnvironment('IV'))));
  //#endregion

  //#region Repos
  sl.registerLazySingleton<LoginRepositoryInterface>(
      () => LoginRepository(sl.get()));

  sl.registerLazySingleton<SocialAppsSignInRepositoryInterface>(
      () => SocialAppsSignInRepository(sl.get()));

  sl.registerLazySingleton<RegisterRepositoryInterface>(
      () => RegisterRepository(sl.get()));

  sl.registerLazySingleton<EmailVerificationRepositoryInterface>(
      () => EmailVerificationRepository(sl.get()));

  sl.registerLazySingleton<ForgetPasswordRepositoryInterface>(
      () => ForgetPasswordRepository(sl.get()));

  sl.registerLazySingleton<DrawerRepositoryInterface>(
      () => DrawerRepository(sl.get()));
  //#endregion

  //#region Data Sources
  sl.registerLazySingleton<LoginRemoteDataSourceInterface>(
      () => LoginRemoteDataSourceImpl());

  sl.registerLazySingleton<SocialAppsSignInRemoteDataSourceInterface>(
      () => SocialAppsSignInRemoteDataSourceImpl());

  sl.registerLazySingleton<RegisterRemoteDataSourceInterface>(
      () => RegisterRemoteDataSourceImpl());

  sl.registerLazySingleton<EmailVerificationRemoteDataSourceInterface>(
      () => EmailVerificationRemoteDataSourceImpl());

  sl.registerLazySingleton<ForgetPasswordRemoteDataSourceInterface>(
      () => ForgetPasswordRemoteDataSourceImpl());

  sl.registerLazySingleton<DrawerRemoteDataSourceInterface>(
      () => DrawerRemoteDataSourceImpl());
  //#endregion

  //#region Use Cases
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl.get()));

  sl.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(sl.get()));

  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl.get()));

  sl.registerLazySingleton<EmailVerificationUseCase>(
      () => EmailVerificationUseCase(sl.get()));

  sl.registerLazySingleton<ForgetPasswordUseCase>(
      () => ForgetPasswordUseCase(sl.get()));

  sl.registerLazySingleton<DrawerUseCase>(() => DrawerUseCase(sl.get()));
  //#endregion

  //#region External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<Encrypter>(() =>
      Encrypter(AES(Key.fromBase64(const String.fromEnvironment('KEY')))));
  //#endregion
}
