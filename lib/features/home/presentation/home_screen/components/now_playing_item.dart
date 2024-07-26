part of '../view/home_screen.dart';

class NowPlayingItem extends StatelessWidget {
  const NowPlayingItem({super.key, required this.movieName});

  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.circle,
                    color: Colors.redAccent,
                  ),
                  const SizedBox(width: 4.0),
                  Text('Now Playing'.toUpperCase(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                movieName,
                textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.surface)),
            ),
          ],
        ));
  }
}
