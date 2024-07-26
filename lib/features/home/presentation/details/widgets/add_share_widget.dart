part of '../view/details_screen.dart';

class AddShareWidget extends StatelessWidget {
  const AddShareWidget({
    super.key,
    this.addOnPressed,
    this.shareOnPressed,
  });

  final void Function()? addOnPressed, shareOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: addOnPressed,
            tooltip: 'Add To Watch List',
            icon: const Icon(
              Icons.add,
            )),
        IconButton(
            onPressed: shareOnPressed,
            tooltip: 'Share Movie',
            icon: const Icon(
              Icons.share,
            )),
      ],
    );
  }
}
