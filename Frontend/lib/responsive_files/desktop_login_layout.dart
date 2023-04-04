// ignore_for_file: prefer_const_constructors

import 'package:econo_cast/constants/constants.dart';
import 'package:econo_cast/login_controller/login_page.dart';
import 'package:econo_cast/responsive_files/desktop_main_layout.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class DesktopLoginLayout extends StatelessWidget {
  const DesktopLoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          /*----------------------1st column with image------------------------------*/
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Image.asset('assets/logo.png')],
            ),
          ),

          /*-----------------2nd column with container-----------------*/
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      /*----------------------Text Heading----------------------*/
                      SizedBox(
                        height: 60.0,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: signInTextInContainer,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),

                      //---------------------1st button-----------------------
                      // SizedBox(height: 20),
                      LoginButton(
                          iconPath: 'assets/google-icon.png',
                          textInButtons: Text('Login with Google'),
                          onPressed: () {
                            LoginPage().googleSignWith(context);
                          }),

                      SizedBox(height: 20),

                      //---------------------2st button-----------------------
                      LoginButton(
                          iconPath: 'assets/fb-icon.png',
                          textInButtons: Text('Login with Facebook'),
                          onPressed: () {}),

                      SizedBox(height: 20),

                      //---------------------3rd button-----------------------
                      LoginButton(
                          iconPath: 'assets/login-icon.png',
                          textInButtons: Text('Login as a Guest'),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const DesktopMainPage();
                            }));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
