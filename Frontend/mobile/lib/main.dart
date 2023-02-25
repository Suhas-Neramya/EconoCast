import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Sign in Page';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
          primarySwatch:Colors.orange

      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[

            Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover),

                ),
                // Foreground widget here
             ),



            Container(
              padding: const EdgeInsets.all(30),

            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold ),

                )),


            Container(
              padding: const EdgeInsets.all(10),
            ),


            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red
                  ),
                  child: const Text('Sign in with Google',textScaleFactor: 1.2,),

                  onPressed: () {
                    if (kDebugMode) {
                      print(nameController.text);
                    }
                    if (kDebugMode) {
                      print(passwordController.text);
                    }
                  },
                )
            ),


            Container(
              padding: const EdgeInsets.all(10),
            ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue
                  ),
                  child: const Text('Sign in with facebook',textScaleFactor: 1.2,),
                  onPressed: () {
                    if (kDebugMode) {
                      print(nameController.text);
                    }
                    if (kDebugMode) {
                      print(passwordController.text);
                    }
                  },
                )
            ),

            Container(
              padding: const EdgeInsets.all(10),

            ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber
                    // border: OutlineInputBorder(),
                  ),
                  child: const Text('Free Login',textScaleFactor: 1.2,),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )
            ),

          ],
        ));
  }
}