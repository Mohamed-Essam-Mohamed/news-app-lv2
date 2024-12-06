import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/home/widget/tab_container.dart';
import 'package:news_app/model/source_respons.dart';
import 'package:news_app/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.categoryId});
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bkColor,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.pColor,
        title: Text(
          "Sports",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 30),
          ),
        ],
      ),
      body: FutureBuilder<SourcesResponse>(
        future: Api.getSources(categoryId: categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "wrong",
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.pColor),
            );
          }
          if (snapshot.data?.status != "ok") {
            return Center(
              child: Text(
                "wrong",
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
            );
          }
          var sourcesList = snapshot.data?.sources ?? [];

          return TabContainerWidget(sourceList: sourcesList);
        },
      ),
    );
  }
}
