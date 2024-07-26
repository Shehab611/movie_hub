import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/home/data/models/result_model.dart';
import 'package:movie_hub/features/home/presentation/shared/components/see_more_component.dart';
import 'package:movie_hub/features/home/presentation/shared/widgets/image_widget.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key, required this.title, this.model});

  final String title;
  final ResultModel? model;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SeeMoreScreenComponent(
              seeMoreTitle: title,
              model: model,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  model?.movies.length ?? 5,
                  (index) => GestureDetector(
                    onTap: () {
                      AppNavigator.navigateToDetailsScreen(
                          context, model?.movies[index]);
                    },
                    child: CustomShimmer(
                      applyShimmer: model == null,
                      child: Padding(
                        key: Key('Movies Section Shimmer $index $key'),
                        padding: const EdgeInsets.only(
                            right: AppSizes.paddingSizeEight,
                            top: AppSizes.paddingSizeEight),
                        child: ImageWidget(
                            height: MediaQuery.sizeOf(context).height * 0.22,
                            width: MediaQuery.sizeOf(context).width * 0.38,
                            imagePath: model?.movies[index].backdropPath ?? ''),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
