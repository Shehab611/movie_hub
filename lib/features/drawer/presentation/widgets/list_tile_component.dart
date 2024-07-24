part of '../view/app_drawer.dart';

class ListTileComponent extends StatelessWidget {
  const ListTileComponent(
      {super.key,
      required this.leadingIcon,
      required this.title,
      this.routeName = '',
      this.trailingIcon,
      this.onTap,
      this.trailingWidget});

  final IconData leadingIcon;
  final String title, routeName;
  final IconData? trailingIcon;
  final Widget? trailingWidget;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(leadingIcon),
        trailing: trailingWidget ?? Icon(trailingIcon ?? Icons.navigate_next),
        title: Text(AppLocalizations.of(context).translate(title)),
        onTap: onTap ??
            () {
              Navigator.pop(context);
              if (ModalRoute.of(context)!.settings.name! != routeName) {
                if (routeName == AppPathName.kOpenScreen) {
                  context.read<DrawerCubit>().logOut();
                }
                AppNavigator.navigateToScreen(context, routeName);
              }
            },
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key, required this.cubit});

  final DrawerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListTileComponent(
      key: key,
      leadingIcon: Icons.language,
      title: AppStrings.language,
      trailingWidget: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          elevation: 10,
          borderRadius: BorderRadius.circular(15),
          value: cubit.languageValue,
          items: List.generate(cubit.languages.length, (index) {
            List<Locale> languages = cubit.languages;
            return DropdownMenuItem(
              value: languages[index],
              child: Text(AppLocalizations.of(context)
                  .translate(languages[index].languageCode)),
            );
          }),
          onChanged: cubit.changeLocale,
        ),
      ),
      onTap: () {},
    );
  }
}

class DefaultTile extends StatelessWidget {
  const DefaultTile({super.key, required this.tile});

  final TileData tile;

  @override
  Widget build(BuildContext context) {
    return ListTileComponent(
      key: key,
      leadingIcon: tile.icon,
      title: tile.title,
      routeName: tile.routePath,
    );
  }
}

class ThemeTile extends StatelessWidget {
  const ThemeTile({super.key, required this.cubit});

  final DrawerCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListTileComponent(
      key: key,
      leadingIcon: Icons.dark_mode_outlined,
      title: AppStrings.theme,
      trailingIcon: Icons.sunny,
      onTap: () {
        cubit.changeTheme();
      },
    );
  }
}
