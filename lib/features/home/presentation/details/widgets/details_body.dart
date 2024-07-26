part of '../view/details_screen.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ImageWidget(
            imagePath:
                'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
            height: size.height * .4,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(AppSizes.paddingSizeOverLarge)),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: AddShareWidget(),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Movie Name',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: DateLanguageWidget(),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Movie Over View',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const MoviesSection(title: AppStrings.similar)
      ],
    );
  }
}
