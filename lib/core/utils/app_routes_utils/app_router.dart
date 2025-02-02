import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/features/authentication//register/presentation/view/register_screen.dart';
import 'package:movie_hub/features/authentication/email_verification/view/email_verification_screen.dart';
import 'package:movie_hub/features/authentication/email_verification/view_model_manger/email_verification_cubit.dart';
import 'package:movie_hub/features/authentication/forget_password/presentation/view/forget_password_screen.dart';
import 'package:movie_hub/features/authentication/forget_password/presentation/view_model_manger/forget_password_cubit.dart';
import 'package:movie_hub/features/authentication/login/presentation/view/login_screen.dart';
import 'package:movie_hub/features/authentication/login/presentation/view_model_manger/login_cubit.dart';
import 'package:movie_hub/features/authentication/register/presentation/view_model_manger/register_cubit.dart';
import 'package:movie_hub/features/home/presentation/details/view/details_screen.dart';
import 'package:movie_hub/features/home/presentation/home_screen/view/home_screen.dart';
import 'package:movie_hub/features/home/presentation/see_more/view/see_more_screen.dart';
import 'package:movie_hub/features/home/presentation/view_model_manger/home_cubit/home_cubit.dart';
import 'package:movie_hub/features/open_screen/presentation/view/open_screen.dart';
import 'package:movie_hub/features/profile/presentation/view/profile_screen.dart';
import 'package:movie_hub/features/profile/presentation/view_model_manger/profile_cubit.dart';

part 'app_navigator.dart';

part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    //#region Authentication Routes
    AppPathName.kOpenScreen: (BuildContext context) =>
        const OpenScreen(key: Key('Open Screen')),
    AppPathName.kLoginScreen: (BuildContext context) => BlocProvider(
          key: const Key('Login Screen Bloc Provider'),
          create: (context) => LoginCubit(sl.get(), sl.get()),
          child: const LoginScreen(
            key: Key('Login Screen'),
          ),
        ),
    AppPathName.kRegisterScreen: (BuildContext context) => BlocProvider(
          key: const Key('Register Screen Bloc Provider'),
          create: (context) => RegisterCubit(sl.get(), sl.get(), sl.get()),
          child: const RegisterScreen(key: Key('Register Screen')),
        ),
    AppPathName.kForgetPasswordScreen: (BuildContext context) => BlocProvider(
          create: (context) => ForgetPasswordCubit(sl.get()),
          child: const ForgetPasswordScreen(key: Key('ForgetPassword Screen')),
        ),
    AppPathName.kEmailVerificationScreen: (BuildContext context) =>
        BlocProvider(
          key: const Key('Email Verification Screen Bloc Provider'),
          create: (context) => EmailVerificationCubit(sl.get(), sl.get())
            ..checkIfUserEmailVerified(),
          child: const EmailVerificationScreen(
              key: Key('Email Verification Screen')),
        ),
    //#endregion

    //#region Home Routes
    AppPathName.kHomeScreen: (BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => PopularCubit(sl.get())..getMovies(),
            ),
            BlocProvider(
              create: (context) => TopRatedCubit(sl.get())..getMovies(),
            ),
            BlocProvider(
              create: (context) => NowPlayingCubit(sl.get())..getMovies(),
            ),
            BlocProvider(
              create: (context) => UpComingCubit(sl.get())..getMovies(),
            ),
          ],
          child: const HomeScreen(key: Key('Home Screen')),
        ),
    AppPathName.kDetailsScreen: (BuildContext context) =>
        const DetailsScreen(key: Key('Details Screen')),
    AppPathName.kSeeMoreScreen: (BuildContext context) => BlocProvider(
          create: (context) => SeeMoreCubit(sl.get()),
          child: const SeeMoreScreen(key: Key('See More Screen')),
        ),
    //#endregion

    //#region Profile Routes
    AppPathName.kProfileScreen: (BuildContext context) => BlocProvider(
          create: (context) => ProfileCubit(sl.get())..putData(),
          child: const ProfileScreen(key: Key('Profile Screen')),
        ),
    //#endregion
  };
}
