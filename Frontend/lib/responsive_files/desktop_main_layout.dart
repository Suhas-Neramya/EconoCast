import 'dart:html';

import 'package:econo_cast/styles/colors.dart';
import 'package:flutter/material.dart';

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({super.key});

  @override
  State<DesktopMainPage> createState() => _DesktopMainPageState();
}

class _DesktopMainPageState extends State<DesktopMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainPageBg,
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
                color: darkBrownText, // Change this color to the desired color
              ),
            ),
            Spacer(),
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

      //--------------------------------------------------------------------------
      //-----------------------body--------------------------------------------
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
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
                      SizedBox(
                        width: 2,
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
                ),
                SizedBox(height: 10),

                //---------------------------------graph----------------------------
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
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

          //-----------------------------news-----------------------------------
          Expanded(
            flex: 1,
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
