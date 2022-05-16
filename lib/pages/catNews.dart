import 'package:flutter/material.dart';
import 'package:truth/Helper/cateogery.dart';
import 'package:truth/Model/newsData.dart';
import 'package:truth/Model/newsModel.dart';
import 'package:truth/pages/ArticleView.dart';
import 'package:truth/pages/HomePage.dart';

class CatNews extends StatefulWidget {
  String categoryName;
  CatNews({@required this.categoryName});

  @override
  State<CatNews> createState() => _CatNewsState();
}

class _CatNewsState extends State<CatNews> {
  List<NewsModel> CatList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getArticles();
  }

  bool isLoading = true;

  getArticles() async {
    NewsForCategorie catNewsData = new NewsForCategorie();
    await catNewsData.getNewsForCategory(widget.categoryName);
    CatList = catNewsData.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Icon(Icons.arrow_back, color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
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
                      height: 30,
                    ),
                    ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: CatList.length,
                        itemBuilder: (context, index) {
                          return ShowArticleTile(
                              CatList[index].urlToImage,
                              CatList[index].title,
                              CatList[index].description,
                              CatList[index].articleUrl);
                        })
                  ],
                ),
              ),
            ),
    );
  }

  Widget ShowArticleTile(
    String imageUrl,
    String title,
    String desc,
    String blogUrl,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleView(blogUrl: blogUrl)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(imageUrl)),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
              child: Text(
                desc,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
