import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/category/category_fragment.dart';
import 'package:news_app/home/home_screen.dart';

void main() async {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: CategoryFragment());
  }
}
