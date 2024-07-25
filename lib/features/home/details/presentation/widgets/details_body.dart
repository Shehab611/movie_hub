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
            height: size.height * .25,
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
            child: Text('Movie Name'),
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
            child: Text('Movie Over View'),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(AppSizes.paddingSizeDefault),
          sliver: SliverFillRemaining(
            child: MoviesSection(title: AppStrings.similar),
          ),
        ),
      ],
    );
  }
}
