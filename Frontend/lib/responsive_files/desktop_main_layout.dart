import 'dart:async';
import 'dart:convert';
//import 'dart:ffi';
import 'dart:html';

import 'package:econo_cast/responsive_files/DataModel/DataModel.dart';
import 'package:econo_cast/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:switch_up/switch_up.dart';

import '../constants/dropdown_button.dart';
import 'main-page_graph/main_graph.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({super.key});

  @override
  State<DesktopMainPage> createState() => _DesktopMainPageState();
}

class _DesktopMainPageState extends State<DesktopMainPage> {
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
  }

  // void _initValue1() {
  //   Timer.periodic(Duration(seconds: 3), (Timer) {
  //     getPrice();
  //   });
  // }

  // Future<void> getPrice() async {
  //   var url = Uri.parse('https://econocast.pythonanywhere.com/latestPrice');

  //   final responsePrice = await http.get(url);
  //   final databodyPrice = jsonDecode(responsePrice.body).first;

  //   DataModel dataModel = new DataModel.fromJson(databodyPrice);

  //   _streamController.sink.add(dataModel); //stores the data from the url
  // }

  //-------------------------------------------------------------------------
  //-------------------------------Predicting the price state----------------
  String _prediction = " ";
  double _price = 0.00;

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

  //--------------------------Displaying the latest price------------------------------------

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
          ],
        ),
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
                                  top: 10, bottom: 10, left: 100, right: 100),
                              child: PriceGraph(),
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

          //-----------------------------right column-----------------------------------
          //------------------------------news container--------------------------------
          Expanded(
            flex: 2,
            child: Column(
              children: [
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
                            ListTile(),
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
