part of '../view/details_screen.dart';

class DateLanguageWidget extends StatelessWidget {
  const DateLanguageWidget({super.key, this.date, this.language});

  final String? date, language;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.paddingSizeDefault),
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.paddingSizeLarge),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Component(
              data: date ?? '12-10-2022',
              dataDefinition: AppStrings.releaseDate,
              icon: Icons.calendar_month),
          const VerticalDivider(thickness: 2),
          Component(
            data: language?.toUpperCase() ?? 'EN',
            dataDefinition: AppStrings.language,
            icon: Icons.language,
          ),
        ],
      ),
    );
  }
}

class Component extends StatelessWidget {
  const Component(
      {super.key,
      required this.data,
      required this.dataDefinition,
      required this.icon});

  final String data;
  final String dataDefinition;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
            ),
            const SizedBox(width: 7),
            Text(
              AppLocalizations.of(context).translate(dataDefinition),
            ),
          ],
        ),
        Text(
          data,
        ),
      ],
    );
  }
}
