part of '../view/see_more_screen.dart';

class FilmRating extends StatelessWidget {
  const FilmRating({
    super.key,
    required this.rating,
    required this.count,
  });

  final num rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 18,
          color: Colors.amber,
        ),
        Padding(
          padding: const EdgeInsets.only(right: AppSizes.paddingSizeEight),
          child: Text(
            rating.toString(),
          ),
        ),
        Text(
          '($count)',
        )
      ],
    );
  }
}
