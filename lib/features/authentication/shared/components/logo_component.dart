part of 'shared_components.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      key: Key('Image Semantics $key'),
      label:
          AppLocalizations.of(context).translate(AppStrings.logoSemanticLabel),
      child: HeroAnimation(
        key: Key("Hero $key"),
        tag: AppTags.logoTag,
        child: Image.asset(
          key: Key("Image $key"),
          AppImages.logo,
          height: size.height * 0.22,
        ),
      ),
    );
  }
}
