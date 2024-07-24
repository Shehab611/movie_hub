import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_hub/core/components/custom_components/custom_components.dart';
import 'package:movie_hub/core/service_locator.dart';
import 'package:movie_hub/core/utils/app_constants/app_strings.dart';
import 'package:movie_hub/core/utils/app_routes_utils/app_router.dart';
import 'package:movie_hub/core/utils/design_utils/app_theme.dart';
import 'package:movie_hub/features/drawer/presentation/view_model_manger/drawer_cubit.dart';

part '../widgets/drawer_body.dart';
part '../widgets/drawer_body_items.dart';
part '../widgets/drawer_header.dart';
part '../widgets/list_tile_component.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        key: Key("Safe Area Drawer $key"),
        top: true,
        child: Drawer(
          key: Key('Drawer $key'),
          semanticLabel: AppLocalizations.of(context)
              .translate(AppStrings.drawerSemanticLabel),
          child: BlocProvider(
            key: Key('Drawer Bloc Provider Body $key'),
            create: (context) => DrawerCubit(sl.get()),
            child: DrawerBody(
              key: Key('Drawer Body $key'),
            ),
          ),
        ));
  }
}
