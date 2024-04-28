import 'package:flutter/material.dart';
import 'dart:math' as math;

part 'widget/app_bar.dart';

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
            const SizedBox(height: 18.0),
            const Expanded(
              flex: 2,
              child: _ItemList(),
            ),
            const SizedBox(height: 18.0),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}

class _ItemList extends StatefulWidget {
  const _ItemList({super.key});

  @override
  State<_ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<_ItemList> {
  final PageController controller = PageController(viewportFraction: 0.78);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5,
      controller: controller,
      padEnds: false,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('\$48',style: TextStyle(fontSize: 24.0)),
                Expanded(
                  child: Stack(
                    children: [
                      const VerticalDivider(
                        thickness: 1.2,
                        color: Colors.white54,
                        indent: 18.0,
                        endIndent: 18.0,
                      ),
                      Center(
                        child: Transform(
                          transform: Matrix4.rotationZ((-math.pi / 180.0) * 50.0),
                          alignment: Alignment.center,
                          child: Transform.translate(
                            offset: const Offset(-10, 0),
                            child: Image.asset("images/products/11.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Shoe name\n(DJ251-101)',
                  style: TextStyle(fontSize: 20.0),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Image.asset('images/icons/bag.png'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
