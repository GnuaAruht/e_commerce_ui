import 'package:e_commerce_ui/model/shoe_model.dart';
import 'package:e_commerce_ui/page/detail/product_detail_page.dart';
import 'package:e_commerce_ui/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const ECommerceApp());

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            final shoe = state.extra as ShoeModel;
            return ProductDetailPage(shoe: shoe);
          },
        )
      ],
    ),
  ],
);

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Ecommerce UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
    );
  }
}
