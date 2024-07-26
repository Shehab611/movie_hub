part of '../view/see_more_screen.dart';

class FilmInfoWidget extends StatelessWidget {
  const FilmInfoWidget({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Card(
      child: ListTile(
        onTap: () {
          AppNavigator.navigateToDetailsScreen(context, movie);
        },
        leading: ImageWidget(
          imagePath: movie.backdropPath,
          height: size.height * 0.22,
          width: size.width * 0.25,
          fit: BoxFit.cover,
        ),
        title: Text(
          movie.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: FilmRating(rating: movie.voteAverage, count: movie.voteCount),
      ),
    );
  }
}
