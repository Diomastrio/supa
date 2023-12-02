import 'package:flutter/material.dart';

class CategoriesOptions {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;
  final String image;

  CategoriesOptions({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen,
    required this.image,
  });
}
