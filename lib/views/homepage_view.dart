import 'package:flutter/material.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';
import 'package:shoppingapp2/views/product_view.dart';
import 'package:shoppingapp2/widgets/category_card.dart';
import 'package:shoppingapp2/widgets/special_card.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade300,
          iconTheme: new IconThemeData(color: Colors.black38),
          flexibleSpace: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
         
        ),
        endDrawer: Drawer(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    //padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(dashboard), fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Text(
                        appname,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 22.0,
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  //height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.black38,
                            fontFamily: 'Nexa',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDisplayPage(
                                categoryname: 'Saree',
                                headerimage: saree5,
                              )));
                            } ,child: CategoryCard(productname: 'Saree',image: saree5,)),

                            InkWell(onTap:() {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDisplayPage(
                                categoryname: 'Tops',
                                headerimage: tops,
                              )));
                            } ,child: CategoryCard(productname: 'Tops',image:tops)),

                            InkWell(onTap: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDisplayPage(
                                categoryname: 'Blouse',
                                headerimage: blouse,
                              )));
                            }, child: CategoryCard(productname: 'Blouse',image: blouse,)),


                            InkWell(onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDisplayPage(
                                categoryname: 'Trouser',
                                headerimage: trousers,
                              )));
                            }, child: CategoryCard(productname: 'Trouser',image: trousers,)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 10.0,),
              Expanded(
                flex: 3,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: SpecialCard(),
                )
                ),
            ],
          ),
        ),
      ),
    );
  }
}
