import 'package:e_commerce_ui/const/app_const.dart';
import 'package:e_commerce_ui/model/shoe_model.dart';
import 'package:flutter/material.dart';


part 'widget/detail_container.dart';
part 'widget/size_list.dart';
part 'widget/cart_button.dart';

class ProductDetailPage extends StatelessWidget {
  final ShoeModel shoe;

  const ProductDetailPage({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Material(
            type: MaterialType.transparency,
            child: _ProductDetailContainer(
              shoe: shoe,
              height: mediaQuery.size.height * 0.6,
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                top: mediaQuery.padding.top + kToolbarHeight + defaultPadding,
                bottom: defaultPadding + 20.0,
              ),
            ),
          ),
          const SizedBox(height: defaultPadding * 2),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding * 1.4),
            child: _ProductSizeList(),
          ),
          const Spacer(),
          AddToCartButton(onPressed: () {}),
          const Spacer(),
        ],
      ),
    );
  }
}

