import 'package:e_commerce_ui/model/shoe_model.dart';
import 'package:flutter/material.dart';

abstract class TempData {
  static final shoeList = [
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
      bgColor: const Color(0xFF8A8787),
    ),
  ];
}
