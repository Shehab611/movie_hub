part of '../view/app_drawer.dart';

class DrawerBodyItems extends StatelessWidget {
  const DrawerBodyItems({super.key, required this.cubit});

  final DrawerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      key: Key('Drawer Body Items List $key'),
      itemCount: cubit.tileData.length + cubit.extraLength,
      semanticChildCount: cubit.tileData.length + cubit.extraLength,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomSlideTransition(
          key: Key('Custom Slide Transition drawer elements $index $key'),
          animationDuration: cubit.animationDuration,
          isLeftToRight: cubit.isEnglish,
          animationDelayDuration: cubit.animationDelayDuration(index),
          child: ChildItem(
            key: Key('Child Item $key'),
            index: index,
            cubit: cubit,
          ),
        );
      },
    );
  }
}

class ChildItem extends StatelessWidget {
  const ChildItem({super.key, required this.index, required this.cubit});

  final int index;
  final DrawerCubit cubit;

  @override
  Widget build(BuildContext context) {
    if (index < cubit.tileData.length - 1) {
      return DefaultTile(tile: cubit.tileData[index]);
    } else if (index < cubit.tileData.length) {
      return ThemeTile(cubit: cubit);
    } else if (index == cubit.tileData.length) {
      return LanguageTile(cubit: cubit);
    }
    return DefaultTile(
      tile: cubit.tileData.last,
    );
  }
}
