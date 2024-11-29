import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/source_respons.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=f94ad79a2ad3401cab630a138b54dbaf
class Api {
  static String baseUrl = "newsapi.org";
  static Future<SourcesResponse> getSources() async {
    Uri url = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "apiKey": "f94ad79a2ad3401cab630a138b54dbaf",
    });
    var response = await http.get(url);
    var bodyString = response.body;
    var json = jsonDecode(bodyString);
    return SourcesResponse.fromJson(json);
  }
}
