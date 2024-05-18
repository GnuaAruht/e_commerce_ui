part of '../home_page.dart';

class _BagContainer extends StatelessWidget {
  const _BagContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      child: Image.asset('images/icons/bag.png'),
    );
  }
}
