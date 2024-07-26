import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/home/data/models/result_model.dart';
import 'package:movie_hub/features/home/domain/entities/movie.dart';
import 'package:movie_hub/features/home/presentation/shared/widgets/image_widget.dart';
import 'package:movie_hub/features/home/presentation/view_model_manger/home_cubit/home_cubit.dart';

part '../widgets/film_info_widget.dart';
part '../widgets/film_rating_widget.dart';
part '../widgets/see_more_body.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: SeeMoreBody(
        key: Key('See More Body $key'),
        model: data['model'],
        name: data['name'],
      ),
    );
  }
}
