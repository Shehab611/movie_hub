import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/usable_functions/validate_check.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/drawer/presentation/view/app_drawer.dart';
import 'package:movie_hub/features/profile/presentation/components/edit_row_text_field.dart';
import 'package:movie_hub/features/profile/presentation/view_model_manger/profile_cubit.dart';

part '../widgets/change_password_sheet.dart';
part '../widgets/profile_body.dart';
part '../widgets/text_fields.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Profile Scaffold Semantics $key'),
      label: AppLocalizations.of(context)
          .translate(AppStrings.profileScreenSemanticLabel),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileUpdateUserDataSuccessfulState) {
            showCustomSnackBar(
                AppLocalizations.of(context)
                    .translate(AppStrings.updateUserDataSuccessful),
                context,
                isError: false,
                inTop: true);
          } else if (state is ProfileSameDataState) {
            showCustomSnackBar(
                AppLocalizations.of(context).translate(AppStrings.sameData),
                context);
          }
        },
        child: Scaffold(
          key: Key('Profile Scaffold $key'),
          appBar: AppBar(
            key: Key('Profile AppBar $key'),
            title: Text(
              AppLocalizations.of(context).translate(AppStrings.profileScreen),
            ),
          ),
          drawer: AppDrawer(
            key: Key("App Drawer in $key"),
          ),
          body: Center(
            key: Key('Profile Body $key'),
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: const Padding(
                  padding: EdgeInsets.all(AppSizes.paddingSizeDefault),
                  child: ProfileBody(),
                )),
          ),
        ),
      ),
    );
  }
}
