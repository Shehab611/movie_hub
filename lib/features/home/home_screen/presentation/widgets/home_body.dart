part of '../view/home_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        NowPlayingSection(),
        MoviesSection(
          title: AppStrings.popular,
        ),
        MoviesSection(title: AppStrings.topRated),
        MoviesSection(title: AppStrings.upComing),
      ],
    );
  }
}
