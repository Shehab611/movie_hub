import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_images.dart';


class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(AppAnimatedImages.noDataAnimation),
           Text(
           AppLocalizations.of(context).translate(AppStrings.noData),
          )
        ],
      ),
    );
  }
}
