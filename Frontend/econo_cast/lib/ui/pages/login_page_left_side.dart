import 'package:flutter/material.dart';

class LoginPageLeftSide extends StatelessWidget {
  const LoginPageLeftSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          //

          children: [
            const Text(
              "Login",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 12,
            ),
            // const Text(
            //   "The safest site on the web for storing your data!",
            //   style: TextStyle(fontSize: 12),
            // ),
            // const SizedBox(height: 24),
            // const TextField(
            //   decoration: InputDecoration(
            //       label: Text("email"),
            //       hintText: "Please write your email address"),
            // ),
            // const TextField(
            //   decoration: InputDecoration(
            //       label: Text("password"),
            //       hintText: "Please write your password"),
            // ),
            // const SizedBox(height: 24),
            // Align(
            //   alignment: Alignment.topRight,
            //   child: MaterialButton(
            //     child: const Text("Forget password?"),
            //     onPressed: () {},
            //   ),
            // ),
            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () {},
              child: Text("Login with Google"),
              minWidth: double.infinity,
              height: 52,
              elevation: 0,
              color: Color.fromARGB(255, 248, 211, 146),
              textColor: Color.fromARGB(255, 107, 65, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            ),

            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () {},
              child: Text("Login with Google"),
              minWidth: double.infinity,
              height: 52,
              elevation: 0,
              color: Color.fromARGB(255, 248, 211, 146),
              textColor: Color.fromARGB(255, 107, 65, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            ),
            const SizedBox(height: 24),
            MaterialButton(
              onPressed: () {},
              child: Text("Login with Google"),
              minWidth: double.infinity,
              height: 52,
              elevation: 0,
              color: Color.fromARGB(255, 248, 211, 146),
              textColor: Color.fromARGB(255, 107, 65, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
            )
          ],
        ),
      ),
    ));
  }
}
