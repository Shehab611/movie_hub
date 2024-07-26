part of '../view/see_more_screen.dart';

class SeeMoreBody extends StatelessWidget {
  const SeeMoreBody({super.key, required this.model});

  final ResultModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeeMoreCubit, SeeMoreState>(
      listener: (context, state) {
        if (state is SeeMoreFailedState) {
          showCustomSnackBar(state.error, context);
        }
      },
      builder: (context, state) {
        return ListView.builder(
            controller: context.read<SeeMoreCubit>().scrollController,
            itemCount: model.movies.length + 1,
            itemBuilder: (context, index) {
              if (index < model.movies.length) {
                return FilmInfoWidget(
                    key: Key('Film Info Widget $index $key'),
                    movie: model.movies[index]);
              } else {
                context
                    .read<SeeMoreCubit>()
                    .scrollController
                    .addListener(() async {
                  model.movies.addAll((await context
                          .read<SeeMoreCubit>()
                          .loadMore(ApiEndPoints.nowPlayingMovies,
                              model.totalPages.toInt()))
                      .toSet());
                });
                return const CustomLoader();
              }
            });
      },
    );
  }
}
