part of '../product_detail_page.dart';

const _sizeList = ["8", "8.5", "9", "9.5", "10"];

class _ProductSizeList extends StatelessWidget {
  const _ProductSizeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Text(
              'Size',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Spacer(),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
              child: Row(
                children: [
                  Text('UK'),
                  SizedBox(width: 12.0),
                  Text('US', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 12.0),
                  Text('EU', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _sizeList.indexed
              .map((e) => _SizeItem(isSelected: e.$1 == 3, size: e.$2))
              .toList(),
        ),
      ],
    );
  }
}

class _SizeItem extends StatelessWidget {
  final bool isSelected;
  final String size;

  const _SizeItem({
    super.key,
    this.isSelected = false,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.0,
      height: 56.0,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.black12,
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: Alignment.center,
      child: Text(
        size,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16.0,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
