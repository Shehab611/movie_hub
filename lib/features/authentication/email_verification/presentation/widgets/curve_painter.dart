part of '../view/email_verification_screen.dart';

class VerificationBackgroundCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width, y = size.height;
    Paint paint = Paint();
    final path = Path();
    path.moveTo(0, y * .8);
    path.quadraticBezierTo(x * .5, y * .6, x, y * .82);
    path.lineTo(x, y);
    path.lineTo(0, y);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
