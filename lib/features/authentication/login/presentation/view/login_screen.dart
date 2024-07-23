import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/authentication/login/presentation/view_model_manger/login_cubit.dart';
import 'package:movie_hub/features/authentication/shared/components/shared_components.dart';

part '../widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Login Scaffold Semantics $key'),
      label: AppLocalizations.of(context)
          .translate(AppStrings.loginScaffoldSemanticLabel),
      child: Scaffold(
        key: Key('Login Scaffold $key'),
        appBar: AppBar(
          key: Key('Login AppBar $key'),
          title: HeroAnimation(
            key: Key("Hero Login Text $key"),
            tag: AppTags.loginTextTag,
            child:
                Text(AppLocalizations.of(context).translate(AppStrings.login)),
          ),
        ),
        body: CustomScrollView(
          key: Key("Custom Scroll View login $key"),
          slivers: [
            SliverPadding(
              key: Key("Sliver Padding login $key"),
              padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
              sliver: SliverFillRemaining(
                key: Key("Sliver fill reaming login $key"),
                hasScrollBody: false,
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is GoogleLoginSuccessState) {
                      AppNavigator.navigateToHomeScreen(context);
                    }
                  },
                  builder: (context, state) {
                    return LoginBody(
                      key: Key("Login body $key"),
                      cubit: BlocProvider.of<LoginCubit>(context),
                      state: state,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
