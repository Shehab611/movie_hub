import 'package:flutter/material.dart';
import 'package:movie_hub/features/drawer/presentation/view/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(
        key: Key("App Drawer in $key"),
      ),
    );
  }
}
