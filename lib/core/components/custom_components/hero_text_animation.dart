import 'package:flutter/material.dart';

class HeroTextAnimation extends StatelessWidget {
  const HeroTextAnimation({super.key, required this.tag, required this.child});
  final Object tag;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tag,
        transitionOnUserGestures: true,
        flightShuttleBuilder: (flightContext, animation, flightDirection,
            fromHeroContext, toHeroContext) {
          final Widget toHero = toHeroContext.widget;
          return ScaleTransition(
            scale: animation.drive(
              Tween<double>(begin: 0.0, end: 1.0).chain(
                CurveTween(
                  curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
                ),
              ),
            ),
            child: toHero,
          );
        },
        child: child);
  }
}
