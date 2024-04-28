part of '../home_page.dart';

class _AppBar extends StatelessWidget {
  const _AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'images/icons/bars.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'images/icons/search.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
