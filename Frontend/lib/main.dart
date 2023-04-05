import 'package:econo_cast/responsive_files/desktop_login_layout.dart';
import 'package:econo_cast/responsive_files/mobile_login_layout.dart';
import 'package:econo_cast/responsive_files/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options_mobile.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
