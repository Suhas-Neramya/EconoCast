import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mobile_login_layout.dart';

void main() => runApp(const MobileMainPage());

class MobileMainPage extends StatelessWidget {
  const MobileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == null) {
            return Scaffold(
                drawer: const NavDrawer(),
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 70,
                    alignment: Alignment.topLeft,
                  ),
                  foregroundColor: Colors.brown,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.account_circle_rounded),
                      color: Colors.brown,
                      tooltip: 'Show contact',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('contact')));
                      },
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/background.jpg"), // replace with your own image path
                        fit: BoxFit
                            .cover, // set the image to cover the entire container
                      ),
                    ),
                  ),
                ));
          } else {
            return Scaffold(
                drawer: const NavDrawer(),
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Image.asset(
                    'assets/logo.png',
                    width: 300,
                    height: 70,
                    alignment: Alignment.topLeft,
                  ),
                  foregroundColor: Colors.brown,
                  actions: <Widget>[
                    IconButton(
                      icon: Image.network(FirebaseAuth
                          .instance.currentUser!.photoURL
                          .toString()),
                      color: Colors.brown,
                      tooltip: 'Show contact',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(FirebaseAuth
                                .instance.currentUser!.displayName!)));
                      },
                    ),
                  ],
                ),
                body: SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/background.jpg"), // replace with your own image path
                        fit: BoxFit
                            .cover, // set the image to cover the entire container
                      ),
                    ),
                  ),
                ));
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
    // return Scaffold(
    //     drawer: const NavDrawer(),
    //     appBar: AppBar(
    //       backgroundColor: Colors.white,
    //       title: Image.asset(
    //         'assets/logo.png',
    //         width: 300,
    //         height: 70,
    //         alignment: Alignment.topLeft,
    //       ),
    //       foregroundColor: Colors.brown,
    //       actions: <Widget>[
    //         IconButton(
    //           icon: const Icon(Icons.account_circle_rounded),
    //           color: Colors.brown,
    //           tooltip: 'Show contact',
    //           onPressed: () {
    //             ScaffoldMessenger.of(context)
    //                 .showSnackBar(const SnackBar(content: Text('contact')));
    //           },
    //         ),
    //       ],
    //     ),
    //     body: SafeArea(
    //       child: Container(
    //         decoration: const BoxDecoration(
    //           image: DecorationImage(
    //             image: AssetImage(
    //                 "assets/background.jpg"), // replace with your own image path
    //             fit:
    //                 BoxFit.cover, // set the image to cover the entire container
    //           ),
    //         ),
    //       ),
    //     ));
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/logo-nav.jpg"))),
            child: null,
          ),
          ListTile(
            leading: const Icon(Icons.home_filled),
            title: const Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.perm_device_information),
            title: const Text('About'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Econ'),
                      foregroundColor: Colors.brown,
                    ),
                    body: Container(),
                  );
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper_rounded),
            title: const Text('News'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Econo'),
                      foregroundColor: Colors.brown,
                    ),
                    body: Container(),
                  );
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.notification_add),
            title: const Text('Notification'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Econo'),
                      foregroundColor: Colors.brown,
                    ),
                    body: Container(),
                  );
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.history_outlined),
            title: const Text('History'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: const Text('Econo'),
                      foregroundColor: Colors.brown,
                    ),
                    body: Container(),
                  );
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () async => {
              await GoogleSignIn().signOut(),
              FirebaseAuth.instance.signOut(),
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) {
                  return const MobileLoginLayout();
                },
              ))
            },
          ),
        ],
      ),
    );
  }
}
