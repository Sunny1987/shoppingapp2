import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';
import 'package:shoppingapp2/models/appuser.dart';
import 'package:shoppingapp2/views/cart.dart';
import 'package:shoppingapp2/widgets/favourite_list_widget.dart';

class FavouritesView extends StatefulWidget {
  static String id = 'favourites';
  @override
  _FavouritesViewState createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> tween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    tween = Tween<double>(begin: 400, end: 60).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade300,
          iconTheme: new IconThemeData(color: Colors.black38),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              SizedBox(width: 40.0),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, ShoppingCart.id);
                  }),
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(saree4), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: Text(
                    'Favourites',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 30.0,
                      fontFamily: 'Nexa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: tween.value,
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(top: 40.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0))),
                  child: MyFavouriteListView(
                    uid: Provider.of<AppUser>(context).uid,
                  ),

                  // GridView(

                  //     //   children: <Widget>[

                  //     // ],

                  //     ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
