part of '../view/home_screen.dart';

class NowPlayingWidget extends StatelessWidget {
  const NowPlayingWidget(
      {super.key, required this.imagePath, required this.movieName});

  final String imagePath;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(
          imagePath: imagePath,
          width: double.infinity,
        ),
        NowPlayingItem(
          movieName: movieName,
        )
      ],
    );
  }
}
