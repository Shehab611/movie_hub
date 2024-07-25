import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';

class SeeMoreScreenComponent extends StatelessWidget {
  const SeeMoreScreenComponent({
    super.key,
    required this.seeMoreTitle,
  });

  final String seeMoreTitle;

  // final data model
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppNavigator.navigateToScreen(context, ''), //, data model
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            seeMoreTitle,
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context).translate(AppStrings.seeMore),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ],
      ),
    );
  }
}
