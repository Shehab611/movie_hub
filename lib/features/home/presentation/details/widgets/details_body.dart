part of '../view/details_screen.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ImageWidget(
            imagePath: movie.backdropPath,
            height: size.height * .25,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(AppSizes.paddingSizeOverLarge)),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        /*const SliverPadding(
          padding: EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: AddShareWidget(),
          ),
        ),*/
        SliverPadding(
          padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: DateLanguageWidget(
              date: movie.releaseDate,
              language: movie.originalLanguage,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: Text(
              movie.overview,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        BlocBuilder<SimilarCubit, SimilarState>(
          builder: (context, state) {
            return MoviesSection(
              title: AppStrings.similar,
              model: context.read<SimilarCubit>().model,
            );
          },
        )
      ],
    );
  }
}
