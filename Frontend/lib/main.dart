import 'package:econo_cast/responsive_files/desktop_login_layout.dart';
import 'package:econo_cast/responsive_files/mobile_login_layout.dart';
import 'package:econo_cast/responsive_files/responsive_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(
            mobileLoginScaffold: MobileLoginLayout(),
            desktopLoginScaffold: DesktopLoginLayout()
        )
    );
  }
}
