import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mobile_login_layout.dart';

import '../../news_app_mobile/news_page.dart';
import '../../screens/about_page.dart';
import '../../styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switch_up/switch_up.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import '../../constants/dropdown_button.dart';
import 'DataModel/DataModel.dart';
import 'mobile_login_layout.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class MobileMainPage extends StatefulWidget {
  const MobileMainPage({super.key});

  @override
  State<MobileMainPage> createState() => _MobileMainPage();
}

class _MobileMainPage extends State<MobileMainPage> {
  //--------------------------------------------------------------------------
  List<PriceWeekly> weeklyPrice = [];

  Future<String> getWeeklyPrice() async {
    String url = ('https://econocast.pythonanywhere.com/dailyPrice');
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future loadPriceWeekly() async {
    final String jsonString = await getWeeklyPrice();
    final dynamic jasonResponse = jsonDecode(jsonString);
    for (Map<String, dynamic> i in jasonResponse) {
      weeklyPrice.add(PriceWeekly.fromJson(i));
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
  }

  //-------------------------------Predicting the price state----------------
  double _price = 0.00;
  String _prediction = "";

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

  void _initValue2() {
    _getPrediction();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return Scaffold(
                drawer:
                    NavDrawer().build1(context), //--- side navigation bar----

                backgroundColor: mainPageBg,

                //------ app bar ------------------
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 70,
                    alignment: Alignment.topLeft,
                  ),
                  foregroundColor: Colors.brown,
                  actions: <Widget>[
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

                //--------------------------body----------------------------------------
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    child:
                                                        DropdownButtonExample(),
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
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
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

                                //-------------------price forecast ----------------------
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: mainPageTwoContainers,
                                      elevation: 6.0,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 1),
                                            child: ListTile(
                                              title: Center(
                                                child: Text(
                                                  'Predicted crude oil price change',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              subtitle: Center(
                                                child: Text(
                                                  _prediction,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 23,
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

                          //-------------- crude oil graph --------------

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
                                      height: 15,
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
                                      height: 5,
                                    ),
                                    //-----------------------Switch---------------
                                    SizedBox(
                                      ////////////
                                      width: 300,
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
                                        },
                                        value: 'Settings',
                                      ),
                                    ),
                                    SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: GraphBg,
                                        ),

                                        margin: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
                                        //child: PriceGraph(),
                                        child: FutureBuilder(
                                            future: getWeeklyPrice(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return (SfCartesianChart(
                                                    primaryXAxis: CategoryAxis(
                                                        isInversed:
                                                            true), //-------------------------------
                                                    series: <
                                                        LineSeries<PriceWeekly,
                                                            String>>[
                                                      LineSeries<PriceWeekly,
                                                          String>(
                                                        dataSource: weeklyPrice,
                                                        xValueMapper:
                                                            (PriceWeekly weekly,
                                                                    _) =>
                                                                weekly.date,
                                                        yValueMapper:
                                                            (PriceWeekly weekly,
                                                                    _) =>
                                                                weekly.value,
                                                      )
                                                    ]));
                                              } else {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            }),
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
                  ],
                ),
                //--end body
              );
            } else {
              return Scaffold(
                drawer:
                    NavDrawer().build1(context), //--- side navigation bar----

                backgroundColor: mainPageBg,

                //------ app bar ------------------
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 70,
                    alignment: Alignment.topLeft,
                  ),
                  foregroundColor: Colors.brown,
                  actions: <Widget>[
                    IconButton(
                      icon: Image.network(FirebaseAuth
                          .instance.currentUser!.photoURL
                          .toString()),
                      color: Colors.brown,
                      tooltip: 'Show contact',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(FirebaseAuth
                                .instance.currentUser!.displayName!)));
                      },
                    ),
                  ],
                ),

                //--------------------------body----------------------------------------
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                    child:
                                                        DropdownButtonExample(),
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
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
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

                                //-------------------price forecast ----------------------
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      color: mainPageTwoContainers,
                                      elevation: 6.0,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 1),
                                            child: ListTile(
                                              title: Center(
                                                child: Text(
                                                  'Predicted crude oil price change',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                              subtitle: Center(
                                                child: Text(
                                                  _prediction,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 23,
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

                          //-------------- crude oil graph --------------

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
                                      height: 15,
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
                                      height: 5,
                                    ),
                                    //-----------------------Switch---------------
                                    SizedBox(
                                      ////////////
                                      width: 300,
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
                                        },
                                        value: 'Settings',
                                      ),
                                    ),
                                    SizedBox(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: GraphBg,
                                        ),

                                        margin: EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                            left: 10,
                                            right: 10),
                                        //child: PriceGraph(),
                                        child: FutureBuilder(
                                            future: getWeeklyPrice(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return (SfCartesianChart(
                                                    primaryXAxis: CategoryAxis(
                                                        isInversed:
                                                            true), //-------------------------------
                                                    series: <
                                                        LineSeries<PriceWeekly,
                                                            String>>[
                                                      LineSeries<PriceWeekly,
                                                          String>(
                                                        dataSource: weeklyPrice,
                                                        xValueMapper:
                                                            (PriceWeekly weekly,
                                                                    _) =>
                                                                weekly.date,
                                                        yValueMapper:
                                                            (PriceWeekly weekly,
                                                                    _) =>
                                                                weekly.value,
                                                      )
                                                    ]));
                                              } else {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                            }),
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
                  ],
                ),
                //--end body
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('_price', _price));
    properties.add(StringProperty('_prediction', _prediction));
  }
}

//==================
//-----------------side nav bar---------------------------------------------
class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build1(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.white,
                image:
                    DecorationImage(image: AssetImage("assets/logo-nav.jpg"))),
            child: null,
          ),

          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.perm_device_information),
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AboutPage();
                  },
                ),
              );
            },
          ),

          //News icon of the Navigation bar
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: const Text('News'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NewsPage();
                  },
                ),
              );
            },
          ),

          //Notification icon of the Navigation bar
          ListTile(
            leading: const Icon(Icons.notification_add),
            title: const Text('Notification'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Econo'),
                      foregroundColor: Colors.brown,
                    ),
                    body: Container(),
                  );
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined),
            title: const Text('History'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Econo'),
                      foregroundColor: Colors.brown,
                    ),
                    body: Container(),
                  );
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return const MobileLoginLayout();
                },
              ))
            },
          ),
        ],
      ),
    );
  }
}

//==================
class PriceWeekly {
  PriceWeekly(this.date, this.value);
  final String date;
  final double value;

  factory PriceWeekly.fromJson(Map<String, dynamic> parsedJson) {
    return PriceWeekly(
        parsedJson['date'].toString(), double.parse(parsedJson['value']));
  }
}
