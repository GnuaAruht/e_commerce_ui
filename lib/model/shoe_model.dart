import 'package:flutter/animation.dart';

class ShoeModel {
  final int id;
  final String name;
  final int price;
  final Color bgColor;
  final List<String> images;

  ShoeModel({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.bgColor,
  });
}
