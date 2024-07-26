part of '../view/see_more_screen.dart';

class SeeMoreBody extends StatelessWidget {
  const SeeMoreBody({super.key, required this.model, required this.name});

  final ResultModel model;
  final String name;

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
                  final newList =
                      (await context.read<SeeMoreCubit>().loadMore(name));
                  if (newList != null) {
                    model.movies.addAll(newList);
                  }
                });
                return const CustomLoader();
              }
            });
      },
    );
  }
}
