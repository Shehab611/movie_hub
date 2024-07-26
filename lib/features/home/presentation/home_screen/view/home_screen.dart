import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/usable_functions/api/api_service_helper.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/features/drawer/presentation/view/app_drawer.dart';
import 'package:movie_hub/features/home/presentation/shared/sections/movies_section.dart';
import 'package:movie_hub/features/home/presentation/shared/widgets/image_widget.dart';
import 'package:movie_hub/features/home/presentation/view_model_manger/home_cubit/home_cubit.dart';

part '../components/now_playing_item.dart';
part '../sections/now_playing_section.dart';
part '../widgets/home_body.dart';
part '../widgets/now_playing_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: Key('Home AppBar $key'),
          title: Text(
              AppLocalizations.of(context).translate(AppStrings.homeScreen)),
        ),
        drawer: AppDrawer(
          key: Key("App Drawer in $key"),
        ),
        body: HomeBody(
          key: Key('Home Body $key'),
        ));
  }
}
