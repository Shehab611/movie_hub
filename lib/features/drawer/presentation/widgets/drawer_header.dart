part of '../view/app_drawer.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DrawerCubit>();
    return UserAccountsDrawerHeader(
      key: Key('Drawer Header $key'),
      currentAccountPicture: cubit.user.photoURL != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.paddingSizeDefault),
              child: Image.network(
                cubit.user.photoURL!,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CustomShimmer(child: child);
                },
              ),
            )
          : null,
      accountName: Text(cubit.getUserName()),
      accountEmail: Text(cubit.user.email!),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryContainer,
          ])),
    );
  }
}
