import 'package:flutter/material.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/home/presentation/shared/sections/movies_section.dart';
import 'package:movie_hub/features/home/presentation/shared/widgets/image_widget.dart';

part '../widgets/add_share_widget.dart';
part '../widgets/date_language_widget.dart';
part '../widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        Navigator.popUntil(
            context, ModalRoute.withName(AppPathName.kHomeScreen));
      },
      child: SafeArea(
        top: true,
        child: Scaffold(
          key: Key('Details Scaffold $key'),
          body: const DetailsBody(),
        ),
      ),
    );
  }
}
