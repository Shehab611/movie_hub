part of '../view/profile_screen.dart';

class ChangePasswordSheet extends StatelessWidget {
  const ChangePasswordSheet({super.key, required this.cubit});

  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            height: MediaQuery.of(context).viewInsets.bottom + 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.paddingSizeSmall),
              child: Form(
                key: cubit.changePasswordSheetFormKey,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .translate(AppStrings.changePassword),
                      ),
                      CurrentPasswordTextField(cubit: cubit),
                      NewPasswordTextField(cubit: cubit),
                      ConfirmPasswordTextField(cubit: cubit),
                      ElevatedButton(
                          onPressed: () {
                            cubit.changePassword();
                          },
                          child: Text(AppLocalizations.of(context)
                              .translate(AppStrings.changePassword)))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
