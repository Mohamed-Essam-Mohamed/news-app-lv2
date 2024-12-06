// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/articles_response.dart';

import 'package:news_app/model/source_respons.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=f94ad79a2ad3401cab630a138b54dbaf
class Api {
  static String baseUrl = "newsapi.org";
  static Future<SourcesResponse> getSources(
      {required String categoryId}) async {
    Uri url = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "apiKey": "f94ad79a2ad3401cab630a138b54dbaf",
      "category": categoryId,
    });
    try {
      var response = await http.get(url);
      String bodyString = response.body;

      var json = jsonDecode(bodyString); // Map

      return SourcesResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=f94ad79a2ad3401cab630a138b54dbaf&sources=abc-news
  static Future<ArticlesResponse> getNewsArticles(String sourcesId) async {
    Uri url = Uri.https(baseUrl, "/v2/everything", {
      "apiKey": "f94ad79a2ad3401cab630a138b54dbaf",
      "q": "bitcoin",
      "sources": sourcesId,
    });
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return ArticlesResponse.fromJson(json);
  }
}
