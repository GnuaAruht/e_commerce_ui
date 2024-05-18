import 'package:e_commerce_ui/const/app_const.dart';
import 'package:e_commerce_ui/data/temp_data.dart';
import 'package:e_commerce_ui/model/shoe_model.dart';
import 'package:e_commerce_ui/page/detail/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

part 'widget/product_carousel.dart';
part 'widget/bottom_menu.dart';
part 'widget/app_bar.dart';
part 'widget/bag_container.dart';
part 'widget/shoe_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: Column(
        children: [
          Expanded(flex: 2, child: _ProductCarousel(shoes: TempData.shoeList)),
          // const SizedBox(height: defaultPadding * 2),
          // const Expanded(child: _BottomMenu())
          Expanded(child: Container())
        ],
      ),
    );
  }
}
