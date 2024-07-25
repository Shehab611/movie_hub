part of '../view/home_screen.dart';

class NowPlayingSection extends StatelessWidget {
  const NowPlayingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SliverToBoxAdapter(
      key: Key('Now Playing $key'),
      child: CarouselSlider(
        key: Key('Carousel Slider $key'),
        options: CarouselOptions(
          height: size.height * 0.48,
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: .6,
        ),
        items: List.generate(
          5,
          (index) => const CustomShimmer(
              // key: ValueKey(), the model
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
