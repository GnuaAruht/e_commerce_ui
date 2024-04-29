part of '../product_detail_page.dart';

class _ProductDetailContainer extends StatefulWidget {
  final ShoeModel shoe;
  final double height;
  final EdgeInsetsGeometry padding;

  const _ProductDetailContainer({
    super.key,
    required this.shoe,
    required this.height,
    required this.padding,
  });

  @override
  State<_ProductDetailContainer> createState() =>
      _ProductDetailContainerState();
}

class _ProductDetailContainerState extends State<_ProductDetailContainer> {
  int viewIndex = 0;

  void onItemViewPressed(int index) {
    if (index != viewIndex) {
      setState(() {
        viewIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.shoe.bgColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(86.0),
        ),
        boxShadow: const [defaultBoxShadow],
      ),
      child: Column(
        children: [
          ProductViewList(
            selectedIndex: viewIndex,
            imageUrls: widget.shoe.images,
            onItemPressed: onItemViewPressed,
          ),
          Expanded(
            child: Row(
              children: [
                const VerticalDivider(
                  thickness: 1.2,
                  color: Colors.white54,
                  indent: defaultPadding,
                  endIndent: defaultPadding,
                ),
                const SizedBox(width: defaultPadding * 2),
                Expanded(child: Image.asset(widget.shoe.images[viewIndex])),
                const SizedBox(width: defaultPadding * 2),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          _ProductDescription(shoe: widget.shoe),
        ],
      ),
    );
  }
}

class ProductViewList extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemPressed;
  final List<String> imageUrls;

  const ProductViewList({
    super.key,
    required this.imageUrls,
    required this.selectedIndex,
    required this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imageUrls.indexed.map(
        (e) {
          return GestureDetector(
            onTap: () => onItemPressed(e.$1),
            child: ProductViewItem(
              imageUrl: e.$2,
              isSelected: e.$1 == selectedIndex,
            ),
          );
        },
      ).toList(),
    );
  }
}

class ProductViewItem extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;

  const ProductViewItem({
    super.key,
    required this.imageUrl,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
          width: 2.0,
        ),
      ),
      child: Image.asset(imageUrl),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  final ShoeModel shoe;

  const _ProductDescription({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shoe.name,
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
        Row(
          children: [
            Text(
              '\$ ${shoe.price}',
              style: const TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: defaultPadding * 2),
            const Text(
              "Men's Shoes",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white54,
              ),
            )
          ],
        ),
      ],
    );
  }
}
