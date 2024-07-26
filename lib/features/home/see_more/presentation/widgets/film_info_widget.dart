part of '../view/see_more_screen.dart';

class FilmInfoWidget extends StatelessWidget {
  const FilmInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CustomShimmer(
      applyShimmer: false,
      child: Card(
        child: ListTile(
          isThreeLine: true,
          leading: ImageWidget(
            imagePath:
                'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
            width: size.width * .18,
            fit: BoxFit.cover,
          ),
          title: const Text(
            'Movie Name',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: const Column(
            children: [
              Text(
                'Action , Comedy , Adventure',
              ),
              FilmRating(rating: 5.8, count: 15)
            ],
          ),
        ),
      ),
    );
  }
}
