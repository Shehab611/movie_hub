part of '../view/see_more_screen.dart';

class SeeMoreBody extends StatelessWidget {
  const SeeMoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return const FilmInfoWidget();
        });
  }
}
