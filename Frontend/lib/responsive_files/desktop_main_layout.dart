import 'package:econo_cast/styles/colors.dart';
import 'package:flutter/material.dart';

class DesktopMainPage extends StatefulWidget {
  const DesktopMainPage({super.key});

  @override
  State<DesktopMainPage> createState() => _DesktopMainPageState();
}

class _DesktopMainPageState extends State<DesktopMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainPageBg,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/logo.png', // Replace this with your logo image path
                fit: BoxFit.contain,

                height: 80,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Crude Oil Price Forecast',
              style: TextStyle(
                color: darkBrownText, // Change this color to the desired color
              ),
            ),
            Spacer(),
            IconButton(
                color: mainPageIcons,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.history)),
            IconButton(
                color: mainPageIcons,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.notification_add_outlined)),
            IconButton(
                color: mainPageIcons,
                iconSize: 30,
                onPressed: () {},
                icon: Icon(Icons.person_rounded)),
          ],
        ),
      ),
    );
  }
}
