import 'package:econo_cast/controller/login_controller.dart';
import 'package:econo_cast/responsive_files/mobile_main_layout.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../styles/colors.dart';


class MobileLoginLayout extends StatelessWidget {
  const MobileLoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*------------------Back ground design of the mobile body-----------------*/
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        /*----------------------------------------------------------------*/
        child: Column(
          children: [
            /*-------------------------------------------------------------*/
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 400,
                    height: 400,
                  )
                ],
              ),
            ),

            /*--------------------------------------------------------------*/
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*------------------------------White Container-------------------------*/
                Container(
                  width: 350,
                  height: 300,
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
                        height: 30.0,
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
                        height: 20.0,
                      ),

                      //---------------------1st button-----------------------
                      // SizedBox(height: 20),
                      LoginButton(
                          iconPath: 'assets/google-icon.png',
                          textInButtons: Text('Login with Google'),
                          onPressed: () {
                            LoginController().googleSignWith(context);
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
                              return const MobileMainPage();
                            }));
                          }),
                    ],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
