import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        //title:  Image.asset('assets/logo.png', width: 300,height: 70,alignment: Alignment.topRight,),
         title: Text('Crude Oil Price Forecast',style: TextStyle(color: Colors.brown),),
         backgroundColor: Color(0xFFE1D8B3),
         leading: Container(
           child: Image.asset('assets/logo.png',),
         ),

       ),
      );
    }
}