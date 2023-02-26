import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLoginScaffold;
  final Widget desktopLoginScaffold;

  ResponsiveLayout({
    required this.mobileLoginScaffold,
    required this.desktopLoginScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 501) {
        return mobileLoginScaffold;
      } else {
        return desktopLoginScaffold;
      }
    });
  }
}
