import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text('Crude Oil Price Forecast',style: TextStyle(color: Colors.brown),),
        backgroundColor: Color(0xFFE1D8B3),
      ),

      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child:const SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                'Crude oil is widely recognized as a valuable resource and plays a crucial role in the global economy. Accurately forecasting its future price is of great interest to both financial institutions and governments. However, the complexity of crude oil time series,'
                    ' characterized by non-linear dynamics, chaotic behavior, and intrinsic fractality, poses a significant challenge to achieving high accuracy in price predictions. To tackle this issue, a novel forecasting model called the "ECONO" system has been developed. '
                    'This system provides a comprehensive tool for forecasting crude oil prices in various currencies, presenting price predictors through charts, and delivering up-to-date news related to crude oil. Additionally, the ECONO system offers a reliable prediction of'
                    ' crude oil price changes. In conclusion, the ECONO system has been designed to aid in crude oil forecasting, offering a multi-dimensional view of its price movements and supporting informed decision-making in the industry.',style: TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ),
    );
  }
}