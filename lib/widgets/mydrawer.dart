import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';
import 'package:shoppingapp2/models/appuser.dart';
import 'package:shoppingapp2/services/mainservice.dart';
import 'package:shoppingapp2/views/authentication_view.dart';
import 'package:shoppingapp2/views/product_view.dart';
//import 'package:shoppingapp2/widgets/signoutbox.dart';

class MyDrawer extends StatefulWidget {
  final MainService model;
  MyDrawer({this.model});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AppUser user;

  @override
  void initState() {
    super.initState();
  }

  getUser(BuildContext context) {
    user = Provider.of<AppUser>(context);
  }

  @override
  Widget build(BuildContext context) {
    //AppUser user = ;
    getUser(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            UserDrawerWidgets(user: user),
          ],
        ),
      ),
    );
  }
}

class UserDrawerWidgets extends StatefulWidget {
  const UserDrawerWidgets({
    Key key,
    @required this.user,
  }) : super(key: key);

  final AppUser user;

  @override
  _UserDrawerWidgetsState createState() => _UserDrawerWidgetsState();
}

class _UserDrawerWidgetsState extends State<UserDrawerWidgets> {
  bool _isLogoff = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //User widgets...
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              '${widget.user.username}',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ),
        //Divider(color: Colors.grey),

        // user tools...
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 55.0),
          child: ExpansionTile(
            leading: Icon(
              Icons.category,
              color: Colors.blueAccent,
            ),
            title: Text('Categories'),
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDisplayPage(
                              categoryname: 'Saree',
                              headerimage: saree5,
                            )));
                  },
                  child: ListTile(
                    //leading: Icon(Icons.arrow_upward, color: Colors.blueAccent),
                    title: Text('Sarees'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDisplayPage(
                              categoryname: 'Tops',
                              headerimage: tops,
                            )));
                  },
                  child: ListTile(
                    //leading: Icon(Icons.arrow_upward, color: Colors.blueAccent),
                    title: Text('Tops'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDisplayPage(
                              categoryname: 'Blouse',
                              headerimage: blouse,
                            )));
                  },
                  child: ListTile(
                    //leading: Icon(Icons.arrow_upward, color: Colors.blueAccent),
                    title: Text('Blouse'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDisplayPage(
                              categoryname: 'Trouser',
                              headerimage: trousers,
                            )));
                  },
                  child: ListTile(
                    //leading: Icon(Icons.arrow_upward, color: Colors.blueAccent),
                    title: Text('Trousers'),
                  ),
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: Icon(Icons.shopping_basket, color: Colors.blueAccent),
            title: Text('Order History'),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => Favourite()));
          },
          child: ListTile(
            leading: Icon(Icons.favorite, color: Colors.blueAccent),
            title: Text('My Favourites'),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent),
            title: Text('My billing Address'),
          ),
        ),
      ],
    );
  }
}
