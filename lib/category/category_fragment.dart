import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/category/widget/category_item.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryFragment extends StatefulWidget {
  CategoryFragment({super.key});

  @override
  State<CategoryFragment> createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<CategoryModel> categoryList = [];
  @override
  void initState() {
    super.initState();
    categoryList = CategoryModel().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bkColor,
      appBar: AppBar(
        backgroundColor: AppColors.pColor,
        title: Text(
          "Category",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(20),
            Text(
              "Pick your category\nof interest",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Gap(20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            categoryId: categoryList[index].id!,
                          ),
                        ),
                      );
                    },
                    child: CategoryItem(
                      category: categoryList[index],
                      index: index,
                    ),
                  );
                },
                itemCount: categoryList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
