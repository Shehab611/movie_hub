part of '../view/home_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const NowPlayingSection(),
        BlocConsumer<PopularCubit, PopularState>(
          listener: (context, state) {
            if (state is PopularFailedState) {
              showCustomSnackBar(state.error, context);
            }
          },
          builder: (context, state) {
            return MoviesSection(
              model: context.read<PopularCubit>().model,
              key: const Key('popular'),
              title: AppStrings.popular,
            );
          },
        ),
        BlocConsumer<TopRatedCubit, TopRatedState>(
          listener: (context, state) {
            if (state is TopRatedFailedState) {
              showCustomSnackBar(state.error, context);
            }
          },
          builder: (context, state) {
            return MoviesSection(
              model: context.read<TopRatedCubit>().model,
              key: const Key('Top Rated'),
              title: AppStrings.topRated,
            );
          },
        ),
        BlocConsumer<UpComingCubit, UpComingState>(
          listener: (context, state) {
            if (state is UpComingFailedState) {
              showCustomSnackBar(state.error, context);
            }
          },
          builder: (context, state) {
            return MoviesSection(
              model: context.read<UpComingCubit>().model,
              key: const Key('Up Coming'),
              title: AppStrings.upComing,
            );
          },
        ),
      ],
    );
  }
}
