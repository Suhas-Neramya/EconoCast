import 'dart:convert';
import 'dart:html';

import 'package:graphflutter/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?q=crudeoil&sortBy=publishedAt&apiKey=b9b04d9684094bfbad3a0f04cedc8aef";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["context"]);

          news.add(articleModel);
        }
      });
    }
  }
}
