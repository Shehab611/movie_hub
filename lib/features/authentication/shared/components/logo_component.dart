part of 'shared_components.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return HeroAnimation(
      key: Key("Hero $key"),
      tag: AppTags.logoTag,
      child: Image.asset(
        key: Key("Image $key"),
        semanticLabel: AppLocalizations.of(context)
            .translate(AppStrings.logoSemanticLabel),
        AppImages.logo,
        height: size.height * 0.22,
      ),
    );
  }
}
