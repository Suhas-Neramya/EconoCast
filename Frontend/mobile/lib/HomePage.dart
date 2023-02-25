import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget{
  const AppBarApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}

class HomePage extends StatelessWidget {
  final _htmlContent = """
  <iframe title="Oil Prices Blend Chart" scrolling="no" src="https://oilprice.com/freewidgets/get_oilprices_chart/45/4" style="height: 1000; width: 1000"></iframe>
  """;
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        backgroundColor: Colors.amber,



        title: const Text('Econo'),
    foregroundColor: Colors.brown,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.access_time_sharp),
                color: Colors.brown,
                tooltip: 'Show Snackbar',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('This is a snackbar')));
                },
              ),

              IconButton(
                icon: const Icon(Icons.add_alert),
                color: Colors.brown,
                tooltip: 'Show notification',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('notification')));
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

              IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next page',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.amber,
                          title: const Text('Econo'),
                          foregroundColor: Colors.brown,
                        ),
                        body: Container(
                          color:Colors.amber,

                        ),
                      );
                    },
                  ));
                },
              ),


            ]

        ),

      body:  SafeArea(
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

    );



  }
}

