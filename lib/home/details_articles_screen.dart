import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/model/articles_response.dart';
import 'package:news_app/utils/app_colors.dart';

class DetailsArticlesScreen extends StatelessWidget {
  const DetailsArticlesScreen({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bkColor,
      appBar: AppBar(
        backgroundColor: AppColors.pColor,
        title: Text(
          article.source?.name ?? "ABC News",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,

              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                placeholder:
                    (context, url) => SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Gap(10),
            Text(
              article.title ?? "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(20),
            Text(
              article.description ?? "",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Gap(20),
            Text(
              article.content ?? "",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Gap(20),
          ],
        ),
      ),

      floatingActionButton: MaterialButton(
        color: AppColors.pColor,
        onPressed: () {},
        child: Text(
          "View Full Article",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
