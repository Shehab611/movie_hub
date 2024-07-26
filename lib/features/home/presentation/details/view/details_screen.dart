import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/home/domain/entities/movie.dart';
import 'package:movie_hub/features/home/presentation/shared/sections/movies_section.dart';
import 'package:movie_hub/features/home/presentation/shared/widgets/image_widget.dart';
import 'package:movie_hub/features/home/presentation/view_model_manger/home_cubit/home_cubit.dart';

part '../widgets/add_share_widget.dart';
part '../widgets/date_language_widget.dart';
part '../widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      key: Key('Details Scaffold $key'),
      body: BlocProvider(
        create: (context) => SimilarCubit(sl.get())..getMovies(movie.id),
        child: DetailsBody(
          movie: movie,
        ),
      ),
    );
  }
}
