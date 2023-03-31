import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DesktopMainPageState extends StatefulWidget {
  const DesktopMainPageState({super.key});

  @override
  State<DesktopMainPageState> createState() => _DesktopMainPageStateState();
}

class _DesktopMainPageStateState extends State<DesktopMainPageState> {
  String _prediction = "Neutral";

  Future<void> _getPrediction() async {
    final url = Uri.parse('');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final prediction = json('prediction')[0];
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
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
