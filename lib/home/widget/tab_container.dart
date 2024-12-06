import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api.dart';
import 'package:news_app/home/details_articles_screen.dart';
import 'package:news_app/home/widget/tab_item.dart';
import 'package:news_app/model/articles_response.dart';
import 'package:news_app/model/source_respons.dart';
import 'package:news_app/utils/app_colors.dart';

class TabContainerWidget extends StatefulWidget {
  TabContainerWidget({super.key, required this.sourceList});
  List<Sources> sourceList;

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) {
              selectedIndex = index;

              setState(() {});
            },
            tabs:
                widget.sourceList
                    .map(
                      (source) => TabItem(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourceList.indexOf(source),
                      ),
                    )
                    .toList(),
          ),

          FutureBuilder<ArticlesResponse>(
            future: Api.getNewsArticles(
              widget.sourceList[selectedIndex].id ?? "abc-news",
            ),
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
              if (snapshot.data?.status != 'ok') {
                return Text(
                  "wrong",
                  style: TextStyle(fontSize: 30, color: Colors.grey),
                );
              }
              var articlesList = snapshot.data?.articles ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: articlesList.length,
                  itemBuilder:
                      (context, index) =>
                          ArticlesItemWidget(article: articlesList[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ArticlesItemWidget extends StatelessWidget {
  const ArticlesItemWidget({super.key, required this.article});

  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),

      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailsArticlesScreen(article: article),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: MediaQuery.of(context).size.height * 0.3,

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
                fit: BoxFit.fill,
              ),
            ),
            Text(
              article.author ?? "",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            Text(
              article.title ?? "",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              article.publishedAt ?? "",
              style: TextStyle(color: Colors.white, fontSize: 15),
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
