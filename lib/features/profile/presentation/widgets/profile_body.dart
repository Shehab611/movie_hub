part of '../view/profile_screen.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    return Form(
        key: cubit.profileBodyFormKey,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Column(
              key: Key("First Column $key"),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                EmailTextField(
                  key: key,
                  cubit: cubit,
                ),
                FirstNameTextField(
                  key: key,
                  cubit: cubit,
                ),
                LastNameTextField(
                  key: key,
                  cubit: cubit,
                ),
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return RepaintBoundary(
                              child: ChangePasswordSheet(
                            cubit: cubit,
                          ));
                        },
                      );
                    },
                    child: Text(AppLocalizations.of(context)
                        .translate(AppStrings.changePassword)))
              ],
            );
          },
        ));
  }
}
