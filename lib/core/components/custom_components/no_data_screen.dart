part of 'custom_components.dart';


class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(AppAnimatedImages.noDataAnimation),
           Text(
           AppLocalizations.of(context).translate(AppStrings.noData),
          )
        ],
      ),
    );
  }
}
