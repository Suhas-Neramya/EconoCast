import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLoginScaffold;


  const ResponsiveLayout({super.key,
    required this.mobileLoginScaffold,

  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return mobileLoginScaffold;
    }
    );
  }
}
