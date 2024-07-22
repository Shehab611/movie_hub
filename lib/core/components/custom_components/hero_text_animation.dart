part of 'custom_components.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key, required this.tag, required this.child});

  final Object tag;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Hero(
      key:key,
        tag: tag,
        transitionOnUserGestures: true,
        placeholderBuilder: (context, heroSize, child) {
          return Opacity(
            opacity: 0.3,
            child: child,
          );
        },
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          return ScaleTransition(
            key: Key('Scale Transition in hero animation $key'),
            scale: animation.drive(
              Tween<double>(begin: 0.0, end: 1.0).chain(
                CurveTween(
                  curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
                ),
              ),
            ),
            child: toHeroContext.widget,
          );
        },
        child: child);
  }
}
