import 'package:econo_cast/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
//import 'package:note_via/ui/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EconoCast2',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const LoginPage(),
    );
  }
}
