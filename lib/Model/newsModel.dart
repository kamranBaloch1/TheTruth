import 'dart:convert';

import 'package:flutter/cupertino.dart';

class NewsModel {
  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;

  NewsModel(
      {this.title,
      this.description,
      this.author,
      this.content,
      this.publshedAt,
      this.urlToImage,
      this.articleUrl});

  // String title;
  // String urlToImage;
  // String content;
  // String description;
  // String blogUrl;

  // NewsModel(
  //     {@required this.content,
  //     @required this.description,
  //     @required this.title,
  //     @required this.urlToImage,
  //     @required this.blogUrl});
}
