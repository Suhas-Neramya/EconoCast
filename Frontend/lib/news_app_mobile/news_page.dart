import 'package:flutter/material.dart';
import 'article_mobile.dart';
import 'customListTile.dart';
import 'api_service.dart';



void MobileMainPage() => runApp( const MobileNewsPage());

class MobileNewsPage extends StatelessWidget {
  const MobileNewsPage({super.key});


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
          //----News page appbar---
            title:  Text('Crude Oil Price Forecast',
              style: TextStyle(color: Colors.brown),),
            backgroundColor: Color(0xFFE1D8B3)),
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
            //----if crude oil news is not displayed ,this will appear--
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
    );
  }
}