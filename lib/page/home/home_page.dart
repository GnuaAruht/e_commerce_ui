import 'package:e_commerce_ui/const/app_const.dart';
import 'package:e_commerce_ui/model/shoe_model.dart';
import 'package:e_commerce_ui/page/detail/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

part 'widget/app_bar.dart';

part 'widget/product_carousel.dart';

final _shoeList = [
  ShoeModel(
    id: 1,
    name: 'Jordan Stadium 90',
    images: [
      'images/products/11.png',
      'images/products/12.png',
      'images/products/13.png',
    ],
    price: 84,
    bgColor: const Color(0xFFFB6E5E),
  ),
  ShoeModel(
    id: 2,
    name: 'Jordan Stadium 90',
    images: [
      'images/products/21.png',
      'images/products/22.png',
      'images/products/23.png',
    ],
    price: 84,
    bgColor: const Color(0xFF3FC2BE),
  ),
  ShoeModel(
    id: 6,
    name: 'Jordan Stadium 90',
    images: [
      'images/products/31.png',
      'images/products/32.png',
      'images/products/33.png',
    ],
    price: 84,
    bgColor: const Color(0xFFEFBC68),
    // bgColor: const Color(0xFFF6CE71),
  ),
  ShoeModel(
    id: 4,
    name: "Nike Air Force 1 '07",
    images: [
      'images/products/41.png',
      'images/products/42.png',
      'images/products/43.png',
    ],
    price: 84,
    bgColor: const Color(0xFF3DC78F),
  ),
  ShoeModel(
    id: 5,
    name: "Nike Air Force 1 '07",
    images: [
      'images/products/51.png',
      'images/products/52.png',
      'images/products/53.png',
    ],
    price: 84,
    // bgColor: const Color(0xFF6E6B6B),
    bgColor: const Color(0xFF8A8787),
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _AppBar(),
            Expanded(
              flex: 2,
              child: _ProductCarousel(shoes: _shoeList),
            ),
            const SizedBox(height: defaultPadding * 2),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: defaultPadding * 2.0),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final size = Size(
                          constraints.maxWidth,
                          constraints.maxHeight,
                        );
                        final gap = (size.height / 2) / 2;
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CustomPaint(
                              size: size,
                              painter: ArchPainter(),
                            ),
                            Positioned(
                              left: gap,
                              top: gap / 2,
                              child: Container(
                                width: 56.0,
                                height: 56.0,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Image.asset('images/icons/logo_adidas.png'),
                              ),
                            ),
                            Positioned(
                              right: gap,
                              top: gap / 2,
                              child: Container(
                                width: 56.0,
                                height: 56.0,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Image.asset('images/icons/logo_puma.png'),
                              ),
                            ),
                            Positioned(
                              top: -18.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                width: 78.0,
                                height: 78.0,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Image.asset('images/icons/logo_nike.png'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



class ArchPainter extends CustomPainter {
  final painter = Paint()
    ..color = Colors.black38
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.8;

  @override
  void paint(Canvas canvas, Size size) {
    final gap = (size.height / 2) / 2;
    final path = Path();

    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, gap, size.width, size.height);
    canvas.drawPath(path, painter);

    path.moveTo(0, size.height - gap);
    path.quadraticBezierTo(
      size.width / 2,
      0.0,
      size.width,
      size.height - gap,
    );
    canvas.drawPath(path, painter);

    path.moveTo(0, size.height - gap * 2);
    path.quadraticBezierTo(
      size.width / 2,
      -gap * 1.2,
      size.width,
      size.height - gap * 2,
    );
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

