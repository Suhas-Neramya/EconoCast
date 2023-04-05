import 'package:flutter/material.dart';
import 'article_mobile.dart';
import 'customListTile.dart';
import 'api_service.dart';



void MobileMainPage() => runApp( MobileNewsPage());

class MobileNewsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsPage(),
    );
  }
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPage createState() => _NewsPage();
}
class _NewsPage extends State<NewsPage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("News App", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white),
        body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data!.toList();

              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles[index], context));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }
}