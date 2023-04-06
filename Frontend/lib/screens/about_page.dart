import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text('Crude Oil Price Forecast',style: TextStyle(color: Colors.brown),),
        backgroundColor: Color(0xFFE1D8B3),
      ),
    );
  }
}