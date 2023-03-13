import 'package:flutter/material.dart';
import 'package:mobile_app/responsive_file/mobile_loginpg.dart';
import 'package:mobile_app/responsive_file/responsive_layout.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
            mobileLoginScaffold: MobileLoginLayout()));
  }
}


