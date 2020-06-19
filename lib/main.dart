import 'package:flutter/material.dart';
import 'package:shoppingapp2/views/authentication_view.dart';
//import 'package:shoppingapp2/views/homepage_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      initialRoute: AuthenticationView.id,
      routes: {
        AuthenticationView.id : (context) => AuthenticationView(),
      },

    );
  }
}
