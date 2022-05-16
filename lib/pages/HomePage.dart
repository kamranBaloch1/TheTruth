import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:truth/Helper/cateogery.dart';
import 'package:truth/Model/newsData.dart';
import 'package:truth/Model/newsData.dart';
import 'package:truth/pages/ArticleView.dart';
import 'package:truth/pages/catNews.dart';

import '../Helper/data.dart';
import '../Model/newsModel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> catModelList = [];
  List<NewsModel> ArticlesList = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catModelList = getCaterogries();
    getArticles();
  }

  getArticles() async {
    News newsA = new News();
    await newsA.getNews();
    ArticlesList = newsA.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "The",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            Text(
              "Truth",
              style: TextStyle(
                  color: Colors.lightBlue, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: catModelList.length,
                          itemBuilder: (context, index) {
                            return CaterogeryTile(
                                imageUrl: catModelList[index].imageUrl,
                                title: catModelList[index].title);
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ArticlesList.length,
                          itemBuilder: (context, index) {
                            return ShowNewsTile(
                              imgUrl: ArticlesList[index].urlToImage,
                              desc: ArticlesList[index].description,
                              title: ArticlesList[index].title,
                              content: ArticlesList[index].content,
                              posturl: ArticlesList[index].articleUrl,
                              // posturl: ArticlesList[index].blogUrl
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CaterogeryTile extends StatelessWidget {
  String imageUrl;
  String title;

  CaterogeryTile({@required this.imageUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CatNews(categoryName: title.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 5),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShowNewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  ShowNewsTile(
      {@required this.imgUrl,
      @required this.desc,
      @required this.title,
      @required this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      imgUrl, // this image doesn't exist
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.amber,
                          alignment: Alignment.center,
                          child: const Text(
                            'Whoops!',
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      },
                    ),
                    // Image.network(
                    //   imgUrl,
                    //   height: 200,
                    //   width: MediaQuery.of(context).size.width,
                    //   fit: BoxFit.cover,
                    // )
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
