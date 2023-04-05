import 'package:flutter/material.dart';
import 'article_mobile.dart';


class ArticlePage extends StatelessWidget {
  final Article article;
  ArticlePage({required this.article});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(article.title, style: TextStyle(color: Colors.brown),),
          backgroundColor: Color(0xFFE1D8B3),
      ),

      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.urlToImage != null ?
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ) :
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://source.unsplash.com/weekly?coding'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(121, 114, 86, 1),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Text(
                article.source.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              article.content,
              style: TextStyle(
                //  fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            )


          ],

        ),

      ),
    );
  }
}