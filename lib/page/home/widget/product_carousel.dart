part of '../home_page.dart';

class _ProductCarousel extends StatefulWidget {
  final List<ShoeModel> shoes;

  const _ProductCarousel({super.key, required this.shoes});

  @override
  State<_ProductCarousel> createState() => _ProductCarouselState();

}

class _ProductCarouselState extends State<_ProductCarousel> {

  final PageController controller = PageController(viewportFraction: 0.76);
  late List<ShoeModel> shoes = widget.shoes;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      padEnds: false,
      itemCount: shoes.length,
      controller: controller,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.go('/detail', extra: shoes[index]),
          child: _buildItem(index),
        );
      },
    );
  }

  Widget _buildItem(int index) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, __) {
        final double value = controller.position.haveDimensions
            ? (index - controller.page!).clamp(-1, 1)
            : 0.0;
        return _ProductItem(shoe: widget.shoes[index], value: value);
      },
    );
  }

}
