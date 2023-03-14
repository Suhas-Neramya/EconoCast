import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

void main() => runApp(const MobileMainPage());

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MainPage(),

    );
  }
}

class MainPage extends StatelessWidget {
  final _htmlContent = """
  <iframe title="Oil Prices Blend Chart" scrolling="no" src="https://oilprice.com/freewidgets/get_oilprices_chart/45/4" height="600" width="100%"></iframe>
  """;
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  Image.asset('assets/logo.png', width: 300,height: 70,alignment: Alignment.topLeft,),
          foregroundColor: Colors.brown,
          actions: <Widget>[

            IconButton(
              icon: const Icon(Icons.add_alert),
              color: Colors.brown,
              tooltip: 'Show notification',
              onPressed: () {Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Econo'),
                      foregroundColor: Colors.brown,
                    ),
                    body: Container(
                    ),
                  );
                },
              ));
              },
            ),

            IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              color: Colors.brown,
              tooltip: 'Show contact',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('contact')));
              },
            ),

          ],
        ),

        body:  SafeArea(

          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"), // replace with your own image path
                fit: BoxFit.cover, // set the image to cover the entire container
              ),
            ),
            child: SizedBox(
              height: 4000,
              width: 1000,
              child: Html(
                data: _htmlContent,
                // Styling with CSS (not real CSS)
                style: {
                  'iframe': Style(height: 5000, width: 1000),
                },
              ),
            ),
          ),
        )
    );
  }
}