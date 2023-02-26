import 'package:flutter/material.dart';

var googleIcon = ('assets/google-icon.png');
var googleButtonText = Text('Login with Google');

var buttonStyle = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 60.0),
  child: OutlinedButton(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Color.fromRGBO(68, 41, 10, 1)),
      side: MaterialStateProperty.all(
        BorderSide(
          color: Color.fromRGBO(68, 41, 10, 1),
          width: 2.0,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.white),
    ),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(googleIcon, width: 30, height: 30),
          SizedBox(width: 20),
          googleButtonText,
        ],
      ),
    ),
  ),
);
