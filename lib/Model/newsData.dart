import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:truth/Model/newsModel.dart';

class News {
  List<NewsModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=d279ea00933a4af6b6d41f73018604db";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel article = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<NewsModel> news = [];

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=d279ea00933a4af6b6d41f73018604db";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel article = NewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
















// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:truth/Model/newsModel.dart';
// import 'package:http/http.dart' as http;

// class NewsData {
//   List<NewsModel> news = [];

//   Future<void> getNews() async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d279ea00933a4af6b6d41f73018604db";

//     var response = await http.get(Uri.parse(url));

//     var data = jsonDecode(response.body);
//     if (data["status"] == "ok") {
//       data["articles"].forEach((element) {
//         if (element["urlToImage"] != null && element["description"] != null) {
//           NewsModel newsModel = new NewsModel(
//               content: element['content'],
//               description: element['description'],
//               title: element['title'],
//               urlToImage: element['urlToImage'],
//               blogUrl: element["url"]);

//           news.add(newsModel);
//         }
//       });
//     }
//   }
// }

// class CatNewsData {
//   String catName;
//   CatNewsData({@required this.catName});
//   List<NewsModel> catNews = [];

//   Future<void> getNews() async {
//     String url =
//         "https://newsapi.org/v2/top-headlines?country=us&category=$catName&apiKey=d279ea00933a4af6b6d41f73018604db";

//     var response = await http.get(Uri.parse(url));

//     var data = jsonDecode(response.body);
//     if (data["status"] == "ok") {
//       data["articles"].forEach((element) {
//         if (element["urlToImage"] != null && element["description"] != null) {
//           NewsModel newsModel = new NewsModel(
//               content: element['content'],
//               description: element['description'],
//               title: element['title'],
//               urlToImage: element['urlToImage'],
//               blogUrl: element["url"]);

//           catNews.add(newsModel);
//         }
//       });
//     }
//   }
// }
