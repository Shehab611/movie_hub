part of 'custom_components.dart';

class CustomSlideTransition extends StatefulWidget {
  final Widget child;
  final Duration animationDuration;
  final Duration animationDelayDuration;
  final bool isLeftToRight;
  final bool isVertical;
  final bool isTopDown;

  const CustomSlideTransition(
      {super.key,
      required this.child,
      this.animationDuration = Duration.zero,
      this.animationDelayDuration = Duration.zero,
      required this.isLeftToRight,
      this.isVertical = false,
      this.isTopDown = false});

  @override
  CustomSlideTransitionState createState() => CustomSlideTransitionState();
}

class CustomSlideTransitionState extends State<CustomSlideTransition>
    with SingleTickerProviderStateMixin , AutomaticKeepAliveClientMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    late final Offset begin;

    if (widget.isVertical) {
      if (widget.isTopDown) {
        begin = const Offset(0, -1);
      } else {
        begin = const Offset(0, 1);
      }
    } else {
      if (widget.isLeftToRight) {
        begin = const Offset(-1, 0);
      } else {
        begin = const Offset(1, 0);
      }
    }

    _animation = Tween(begin: begin, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(widget.animationDelayDuration, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RepaintBoundary(
      key: Key("Repaint Boundary Key ${widget.key}"),
      child: SlideTransition(
        key: Key("Slide Transition Key ${widget.key}"),
        position: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
