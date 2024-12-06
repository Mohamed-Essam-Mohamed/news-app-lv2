import 'package:flutter/material.dart';
import 'package:news_app/model/source_respons.dart';
import 'package:news_app/utils/app_colors.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.source, required this.isSelected});
  Sources source;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.pColor, width: 2),
        color: isSelected ? AppColors.pColor : Colors.transparent,
      ),
      child: Text(
        source.name ?? "",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
