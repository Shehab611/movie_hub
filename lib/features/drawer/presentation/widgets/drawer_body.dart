part of '../view/app_drawer.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('App Drawer Column $key'),
      children: [
        AppDrawerHeader(
          key: Key('App Drawer Header $key'),
        ),
        DrawerBodyItems(
          key: Key('App Drawer Components $key'),
          cubit: context.read<DrawerCubit>(),
        )
      ],
    );
  }
}
