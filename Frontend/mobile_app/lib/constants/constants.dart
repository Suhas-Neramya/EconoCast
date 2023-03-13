import 'package:flutter/material.dart';
import '../styles/colors.dart';

/*---------------------------Login page button style foe desktop--------------------------------*/

class LoginButton extends StatelessWidget {
  final String iconPath;
  final Widget textInButtons;
  final Color buttonColorBg;
  final onPressed;

  const LoginButton({super.key,
    required this.iconPath,
    required this.textInButtons,
    this.buttonColorBg = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: OutlinedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(loginButtonStroke),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: loginButtonStroke,
              width: 0.5,
            ),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColorBg),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 30, height: 30),
              const SizedBox(width: 10),
              textInButtons, //not the color
            ],
          ),
        ),
      ),
    );
  }
}
