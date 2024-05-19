part of '../home_page.dart';

class _ProductItem extends StatelessWidget {
  final double value;
  final ShoeModel shoe;

  const _ProductItem({
    super.key,
    required this.value,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBgContainer(),
        _buildShoeContent(),
      ],
    );
  }

  Widget _buildShoeContent() {
    final radian = (-math.pi / 180.0) * (50.0 + (50 * value));
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
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
                    child: Hero(
                      tag: shoe.images.first,
                      child: Transform(
                        transform: Matrix4.rotationZ(radian),
                        alignment: Alignment.center,
                        child: Transform.translate(
                          offset: const Offset(-10, 0),
                          child: Image.asset(shoe.images.first),
                        ),
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
            const Align(
              alignment: Alignment.centerRight,
              child: _BagContainer(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBgContainer() {
    return Hero(
      tag: "shoe_${shoe.id}",
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: defaultPadding,
        ),
        decoration: BoxDecoration(
          color: shoe.bgColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: const [defaultBoxShadow],
        ),
      ),
    );
  }

}
