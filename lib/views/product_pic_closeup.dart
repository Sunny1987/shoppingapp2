import 'package:flutter/material.dart';

class ProductCloseUp extends StatefulWidget {

  static String id ='productcloseup';

  @override
  _ProductCloseUpState createState() => _ProductCloseUpState();
}

class _ProductCloseUpState extends State<ProductCloseUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade300,
          iconTheme: new IconThemeData(color: Colors.black38),
        ),
      ),
      
    );
  }
}