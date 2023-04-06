import 'package:flutter/material.dart';
import 'article_mobile.dart';

import 'customListTile.dart';
import 'api_service.dart';

// void MobileMainPage() => runApp(const MobileDesktopNewsPage());

// class MobileDesktopNewsPage extends StatelessWidget {
//   const MobileDesktopNewsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DesktopNewsPage(),
//     );
//   }
// }

class DesktopNewsPage extends StatefulWidget {
  @override
  _DesktopNewsPage createState() => _DesktopNewsPage();
}

class _DesktopNewsPage extends State<DesktopNewsPage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
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
    );
  }
}
