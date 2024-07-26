import 'package:flutter/material.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/home/shared/widgets/image_widget.dart';

part '../widgets/film_info_widget.dart';
part '../widgets/film_rating_widget.dart';
part '../widgets/see_more_body.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? screenName = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).translate(screenName ?? 'popular')),
      ),
      body: const SeeMoreBody(),
    );
  }
}
