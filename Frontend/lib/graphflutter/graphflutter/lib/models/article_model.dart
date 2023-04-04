import 'package:flutter/material.dart';

class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String content;
  DateTime publishedAt;

  ArticleModel(
      {this.author,
      this.url,
      this.description,
      this.content,
      this.urlToImage,
      this.title,
      this.publishedAt});
}
