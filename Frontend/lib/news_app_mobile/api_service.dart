//This class will allows us to make a simple get http request, to the API and
// get the Articles and then return a list of Articles.
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'article_mobile.dart';
//import 'package:news_api_app/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();
  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'q': 'crude oil',
      'sortBy': 'publishedAt',
      'pageSize':'15',
      'apiKey': '2e50924f994647da8f7d38281bd9406f'
    };
    final uri = Uri.https(endPointUrl, '/v2/everything', queryParameters);
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
    body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
