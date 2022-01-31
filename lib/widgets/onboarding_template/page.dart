import 'package:flutter/material.dart';

class PageTemplate {
  final String imageurl;
  final String title;
  final String desc;
  final Color color;
  final double height;
  final double width;

  const PageTemplate({
    Key? key,
    required this.imageurl,
    required this.title,
    required this.desc,
    required this.color,
    required this.height,
    required this.width,
  });
}
