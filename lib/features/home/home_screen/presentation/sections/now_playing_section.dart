part of '../view/home_screen.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SliverToBoxAdapter(
      key: Key('Now Playing $key'),
      child: CarouselSlider(
        options: CarouselOptions(
          height: size.height * 0.48,
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: .6,
        ),
        items: List.generate(
          5,
          (index) => const CustomShimmer(
              applyShimmer: false,
              child: NowPlayingWidget(
                  imagePath:
                      'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
                  movieName: "xxxxxxxxx")),
        ),
      ),
    );
  }
}
