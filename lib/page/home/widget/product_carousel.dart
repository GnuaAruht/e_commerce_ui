part of '../home_page.dart';

class _ProductCarousel extends StatefulWidget {
  final List<ShoeModel> shoes;

  const _ProductCarousel({super.key, required this.shoes});

  @override
  State<_ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<_ProductCarousel> {
  final PageController controller = PageController(viewportFraction: 0.76);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.shoes.length,
      controller: controller,
      padEnds: false,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _onShoeTapped(_shoeList[index]),
          child: _ProductItem(shoe: widget.shoes[index]),
        );
      },
    );
  }

  void _onShoeTapped(ShoeModel shoe) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return ProductDetailPage(shoe: shoe);
      }),
    );
  }
}

class _ProductItem extends StatelessWidget {
  final ShoeModel shoe;

  const _ProductItem({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: 8.0,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        // color: Colors.blue,
        color: shoe.bgColor,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        boxShadow: const [defaultBoxShadow],
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('\$48', style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: defaultPadding),
            Expanded(
              child: Stack(
                children: [
                  const VerticalDivider(
                    thickness: 1.2,
                    color: Colors.white54,
                    indent: defaultPadding,
                    endIndent: defaultPadding,
                  ),
                  Center(
                    child: Transform(
                      transform: Matrix4.rotationZ((-math.pi / 180.0) * 60.0),
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: const Offset(-10, 0),
                        child: Image.asset(shoe.images.first),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${shoe.name}\n(DJ251-101)',
              style: const TextStyle(fontSize: 20.0),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                child: Image.asset('images/icons/bag.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
