import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(category.codeColor!),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
          bottomRight: Radius.circular(index % 2 == 0 ? 0 : 20),
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            category.imageAssets!,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
          const Spacer(),
          Text(
            category.title!,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          Gap(15),
        ],
      ),
    );
  }
}
