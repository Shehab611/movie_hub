part of '../view/home_screen.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return BlocConsumer<NowPlayingCubit, NowPlayingState>(
      listener: (context, state) {
        if (state is NowPlayingFailedState) {
          showCustomSnackBar(state.error, context);
        }
      },
      builder: (context, state) {
        return SliverToBoxAdapter(
          key: Key('Now Playing $key'),
          child: CarouselSlider(
            key: Key('Carousel Slider $key'),
            options: CarouselOptions(
              height: size.height * 0.48,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: .75,
            ),
            items: List.generate(
              context.read<NowPlayingCubit>().model?.movies.length ?? 5,
              (index) => CustomShimmer(
                  key: Key('Now Playing Shimmer $index $key'),
                  applyShimmer: state is NowPlayingLoadingState,
                  child: GestureDetector(
                    onTap: () {
                      final cubit = context.read<NowPlayingCubit>();
                      cubit.navigateToDetailsScreen(
                          context, cubit.model!.movies[index]);
                    },
                    child: NowPlayingWidget(
                      imagePath:
                          '${ApiEndPoints.imagesBaseUrl}${context.read<NowPlayingCubit>().model?.movies[index].backdropPath}',
                      movieName: context
                              .read<NowPlayingCubit>()
                              .model
                              ?.movies[index]
                              .title ??
                          '',
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
