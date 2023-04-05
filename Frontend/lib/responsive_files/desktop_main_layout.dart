import 'dart:convert';
import 'dart:html';

import 'dart:html';

import 'package:econo_cast/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:switch_up/switch_up.dart';

import '../constants/dropdown_button.dart';
import 'desktop_login_layout.dart';
import 'main-page_graph/main_graph.dart';

import 'package:econo_cast/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:switch_up/switch_up.dart';

import '../constants/dropdown_button.dart';
import 'desktop_login_layout.dart';
import 'main-page_graph/main_graph.dart';

import 'package:econo_cast/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:switch_up/switch_up.dart';

import '../constants/dropdown_button.dart';
import 'desktop_login_layout.dart';
import 'main-page_graph/main_graph.dart';


import 'package:flutter/services.dart' show rootBundle;

import 'package:econo_cast/responsive_files/DataModel/DataModel.dart';
import 'package:econo_cast/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:switch_up/switch_up.dart';

import '../constants/dropdown_button.dart';
import 'desktop_login_layout.dart';
import '../news_app_mobile/api_service.dart';
import '../news_app_mobile/article_mobile.dart';
import '../news_app_mobile/customListTile.dart';
import '../news_app_mobile/desktop_news_page.dart';
import '../news_app_mobile/news_page.dart';

import 'main-page_graph/main_graph.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({super.key});

  @override
  State<DesktopMainPage> createState() => _DesktopMainPageState();
}

class _DesktopMainPageState extends State<DesktopMainPage> {
  //--------------------------------------------------------------------------
  List<PriceWeekly> weeklyPrice = [];
  List<PriceWeekly> monthlyPrice = [];
  List<PriceWeekly> yearlyPrice = [];

  Future<String> getWeeklyPrice(String type) async {
    String url = '';

    if (type == 'weekly') {
      url = ('https://econocast.pythonanywhere.com/dailyPrice');
    } else if (type == 'monthly') {
      url = ('https://econocast.pythonanywhere.com/weeklyPrice');
    } else if (type == 'yearly') {
      url = ('https://econocast.pythonanywhere.com/monthlyPrice');
    }

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get Daily price');
    }
  }

  Future loadPriceWeekly() async {
    final String jsonString = await getWeeklyPrice('weekly');
    final dynamic jasonResponse = jsonDecode(jsonString);
    for (Map<String, dynamic> i in jasonResponse) {
      weeklyPrice.add(PriceWeekly.fromJson(i));
    }
  }

  Future loadPriceMonthly() async {
    final String jsonString = await getWeeklyPrice('monthly');
    final dynamic jasonResponse = jsonDecode(jsonString);
    for (Map<String, dynamic> i in jasonResponse) {
      monthlyPrice.add(PriceWeekly.fromJson(i));
    }
  }

  Future loadPriceYearly() async {
    final String jsonString = await getWeeklyPrice('yearly');
    final dynamic jasonResponse = jsonDecode(jsonString);
    for (Map<String, dynamic> i in jasonResponse) {
      yearlyPrice.add(PriceWeekly.fromJson(i));
    }
  }

  //-------------------------------------------------------------------------

  StreamController<DataModel> _streamController = StreamController();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //_initValue1();
    _initValue2();
    _getPrice();
    loadPriceWeekly();
    loadPriceMonthly();
    loadPriceYearly();
  }

  //-------------------------------------------------------------------------
  //-------------------------------Predicting the price state----------------
  String _prediction = " ";
  double _price = 0.00;
  String _chart = 'Week';

  Future<void> _getPrediction() async {
    final url = Uri.parse('https://suhasneramya.pythonanywhere.com/predict');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final prediction = json['prediction'][0];
      setState(() {
        if (prediction == 0.0) {
          _prediction = "Increasing";
        } else if (prediction == 1.0) {
          _prediction = "Decreasing";
        } else {
          _prediction = "Neutral";
        }
      });
    } else {
      throw Exception('Failed to get prediction');
    }
  }

  Future<void> _getPrice() async {
    final url = Uri.parse('https://econocast.pythonanywhere.com/latestPrice');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('-----------------------------print json price ${json['Price']}');
      //final prediction = json['Price'][0];
      setState(() {
        _price = json['Price'];
      });
    } else {
      throw Exception('Failed to get prediction');
    }
  }

  // Future<String> getWeeklyPrice() async {
  //   String url = ('https://econocast.pythonanywhere.com/weeklyPrice');
  //   http.Response response = await http.get(Uri.parse(url));
  //   return response.body;
  // }

  // Future loadWeeklyPrice() async {
  //   final String jsonString = await getWeeklyPrice();
  //   final dynamic jsonResponse = jsonDecode(jsonString);
  //   for (Map<String, dynamic> i in jsonResponse) {
  //     PriceWeekly.add(PriceWeekly.fromJson(i));
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getPrediction();

  //   print(
  //       '-----------------------------initialising page----------------------------------');
  // }

  void _initValue2() {
    _getPrediction();
  }

  getDataSource() {
    if (_chart == 'Week') {
      return weeklyPrice;
    } else if (_chart == 'Month') {
      return monthlyPrice;
    } else {
      return yearlyPrice;
    }
  }

  //--------------------------Displaying the latest price-----------------------------------
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPageBg,

      /**
       * app bar
       */
      appBar: AppBar(
        backgroundColor: mainPageBg,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/logo.png', // Replace this with your logo image path
                fit: BoxFit.contain,

                height: 80,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Crude Oil Price Forecast',
              style: TextStyle(
                color: darkBrownText,
              ),
            ),
            Spacer(),

            //-----------------------------------icons in the app bar--------------------------------------
            IconButton(
                color: mainPageIcons,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.history)),
            IconButton(
                color: mainPageIcons,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.notification_add_outlined)),
            IconButton(
                color: mainPageIcons,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.person_rounded)),
            IconButton(
              color: mainPageIcons,
              iconSize: 30,
              onPressed: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DesktopLoginLayout();
                  },
                ));
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        // automaticallyImplyLeading: false,
      ),

      /*
       * --------------------------------body------------------------------------------
       */
      body: Row(
        children: [
          Expanded(
            flex: 3,

            //-------------------------------left column-------------------------------
            child: Column(
              children: [
                /*
                * --------------------------upper row---------------------------------
                -----------------------------container 1----------------------------------
                */
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      // Expanded(

                      //         return Container(
                      //           padding: EdgeInsets.all(10.0),
                      //           child: Card(
                      //             color: mainPageTwoContainers,
                      //             elevation: 4.0,
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(20),
                      //             ),
                      //             child: Column(
                      //               //mainAxisAlignment: MainAxisAlignment.center,
                      //               children: <Widget>[
                      //                 ListTile(
                      //                   title: Center(
                      //                     child: Text(
                      //                       'Declared Market Price In Dollers',
                      //                       style: TextStyle(
                      //                         color: Colors.white,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 //SizedBox(height: 5),
                      //                 Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   children: [
                      //                     Column(
                      //                       children: [
                      //                         SizedBox(
                      //                           height: 20,
                      //                           child: DropdownButtonExample(),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                     SizedBox(width: 5),
                      //                     Column(
                      //                       children: [
                      //                         Container(
                      //                           child: Text(

                      //                             _price.toString(),
                      //                             style: TextStyle(
                      //                               fontSize: 30,
                      //                               fontWeight: FontWeight.bold,
                      //                               color: Colors.white,
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         );

                      // ),

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Card(
                            color: mainPageTwoContainers,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ListTile(
                                  title: Center(
                                    child: Text(
                                      'Declared Market Price In Dollers',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                //SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          child: DropdownButtonExample(),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 5),
                                    Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            _price.toString(),
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      //-----------------------------------------
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: mainPageTwoContainers,
                            elevation: 4.0,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ListTile(
                                    title: Center(
                                      child: Text(
                                        'Predicted crude oil price change',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    subtitle: Center(
                                      child: Text(
                                        _prediction,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //---------------------------

                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          //---------------------Heading---------------
                          Text(
                            'Crude Oil Price Graph',
                            style: TextStyle(
                              color: darkBrownText,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //-----------------------Switch---------------
                          SizedBox(
                            width: 250,
                            height: 25,
                            child: SwitchUp<String>(
                              backgroundColor: GraphBg,
                              color: mainPageTwoContainers,
                              selectedTextColor: Colors.amber,
                              unselectedTextColor: Colors.amber,
                              items: const <String>[
                                'Week',
                                'Month',
                                'Year',
                              ],
                              onChanged: (String value) {
                                print(value);
                                setState(() {
                                  _chart = value;
                                });
                              },
                              value: 'Settings',
                            ),
                          ),
                          SizedBox(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: GraphBg,
                                ),
                                margin: EdgeInsets.only(
                                    top: 20, bottom: 10, left: 100, right: 100),
                                //child: PriceGraph(),
                                child:
                                    // FutureBuilder(
                                    //     future: getWeeklyPrice('weekly'),
                                    //     builder: (context, snapshot) {
                                    //       if (snapshot.hasData) {
                                    //         return
                                    (SfCartesianChart(
                                        primaryXAxis: CategoryAxis(
                                            isInversed:
                                                true), //-------------------------------
                                        series: <
                                            LineSeries<PriceWeekly, String>>[
                                      LineSeries<PriceWeekly, String>(
                                        dataSource: getDataSource(),
                                        xValueMapper: (PriceWeekly weekly, _) =>
                                            weekly.date,
                                        yValueMapper: (PriceWeekly weekly, _) =>
                                            weekly.value,
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //-----------------------------right column-----------------------------------
          //------------------------------news container--------------------------------
          Expanded(
            flex: 2,
            child: Column(
              children: [
                // SingleChildScrollView(child: DesktopNewsPage),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            AppBar(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              automaticallyImplyLeading: false,
                              backgroundColor: GraphBg,
                              title: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Crude Oil News',
                                        style: TextStyle(
                                            color: darkBrownText,
                                            fontWeight: FontWeight.bold))
                                  ]),
                            ),
                            Container(
                              height: 470,
                              child: DesktopNewsPage(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceWeekly {
  PriceWeekly(this.date, this.value);
  final String date;
  final double value;

  factory PriceWeekly.fromJson(Map<String, dynamic> parsedJson) {
    return PriceWeekly(
        parsedJson['date'].toString(), double.parse(parsedJson['value']));
  }
}

//--------------------------news container eke code ekak- still doing--
class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  //const CategoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: 120,
            height: 60,
          )
        ],
      ),
    );
  }
}
