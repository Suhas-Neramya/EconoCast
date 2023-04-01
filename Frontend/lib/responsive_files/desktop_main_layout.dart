import 'dart:convert';
import 'dart:html';
//import 'package:econo_cast/responsive_files/prediction_state/prediction_state.dart';
import 'package:econo_cast/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/dropdown_button.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({super.key});

  @override
  State<DesktopMainPage> createState() => _DesktopMainPageState();
}

class _DesktopMainPageState extends State<DesktopMainPage> {
  String _prediction = "Text";

  // Future<void> _getPrediction() async {
  //   print('--------------------running prediction-------------');
  //   final url = Uri.parse('https://suhasneramya.pythonanywhere.com/predict');
  //   final response = await http.get(url);
  //   print('-----------------response status code : ${response.body}');
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     final prediction = json('prediction')[0];
  //     print('print prediction : $prediction');
  //     setState(() {
  //       print('----------------changing state--------------------');
  //       if (prediction == 0.0) {
  //         _prediction = "Increasing";
  //       } else if (prediction == 1.0) {
  //         _prediction = "Decreasing";
  //       } else {
  //         _prediction = "Neutral";
  //       }
  //     });
  //   } else {
  //     print('----------------------response exception----------------');
  //     throw Exception('Failed to get prediction');
  //   }
  // }

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

  @override
  void initState() {
    super.initState();
    _getPrediction();
    print(
        '-----------------------------initialising page----------------------------------');
  }

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
                //-------------------------------upper row------------------------------
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Expanded(
                            child: Card(
                              color: mainPageTwoContainers,
                              elevation: 4.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ListTile(
                                    title: Center(
                                      child: Text(
                                          'Declared Market Price In Dollers',
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          DropdownButtonExample(),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          Container(
                                              child: Text(
                                            '80.00',
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          // width: 300,
                          // height: 200,
                          padding: EdgeInsets.all(16.0),
                          child: Expanded(
                            child: Card(
                              color: mainPageTwoContainers,
                              elevation: 4.0,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: ListTile(
                                      //leading: Icon(Icons.person),
                                      title: Center(
                                        //padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Predicted crude oil price change',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      //subtitle: Text('john.doe@example.com'),

                                      subtitle: Center(
                                        child: Text(
                                          _prediction,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                //---------------------------------below row----------------------------
                //-----------------------------------graph--------------------------------
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        //flex: 2,
                        child: Container(
                          //width: 800,
                          padding: EdgeInsets.all(16.0),
                          child: Expanded(
                            child: Card(
                              color: mainPageTwoContainers,
                              elevation: 4.0,
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    //leading: Icon(Icons.person),
                                    title: Text(
                                        'Declared Market Price In Dollers',
                                        style: TextStyle(color: Colors.white)),
                                    //subtitle: Text('john.doe@example.com'),
                                    subtitle: Text(
                                      '18% of products are sold',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Chip(
                                        label: Text(
                                      '4,500',
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
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
                    // width: 400,
                    // height: 200,
                    padding: EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Card(
                        color: mainPageTwoContainers,
                        elevation: 4.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              //leading: Icon(Icons.person),
                              title: Text('Declared Market Price In Dollers',
                                  style: TextStyle(color: Colors.white)),
                              //subtitle: Text('john.doe@example.com'),
                              subtitle: Text(
                                '18% of products are sold',
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Chip(
                                  label: Text(
                                '4,500',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
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
