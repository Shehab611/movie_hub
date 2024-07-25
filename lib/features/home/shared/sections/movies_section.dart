import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/home/shared/components/see_more_component.dart';
import 'package:movie_hub/features/home/shared/widgets/image_widget.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SeeMoreScreenComponent(
              seeMoreTitle: AppLocalizations.of(context).translate(title),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Padding(
                    //key: ,
                    padding: const EdgeInsets.only(
                        right: AppSizes.paddingSizeEight,
                        top: AppSizes.paddingSizeEight),
                    child: ImageWidget(
                        height: MediaQuery.sizeOf(context).height * 0.2,
                        imagePath:
                            'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg'),
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
