import 'package:flutter/material.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';
import 'package:shoppingapp2/views/product_pic_closeup.dart';
import 'package:shoppingapp2/widgets/mydrawer.dart';

class ProductDetailsPage extends StatefulWidget {
  static String id = 'productdetails';

  final String image;
  final String name;
  final String price;

  ProductDetailsPage({this.image, this.name, this.price});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> tween;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    tween = Tween<double>(begin: 300, end: 0).animate(_controller)
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
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
            ],
          ),

          //IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ),
        endDrawer: MyDrawer(),
        body: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductCloseUp()));
          },
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image), fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Material(
                                elevation: 8.0,
                                borderRadius: BorderRadius.circular(30.0),
                                child: IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Color(myyellow),
                                    ),
                                    onPressed: () {}),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 300,
                        ),
                        Expanded(
                          //flex: 4,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: tween.value,
                              ),
                              Expanded(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(80.0),
                                        //topRight: Radius.circular(20.0)
                                      )),
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          // SizedBox(
                                          //   height: 0,
                                          // ),
                                          Row(
                                            children: <Widget>[
                                              Text('widget.name',
                                                  style: TextStyle(
                                                      fontFamily: 'Nexa',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text('widget.price',
                                                  style: TextStyle(
                                                      fontFamily: 'Nexa',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              // SizedBox(
                                              //   width: 40,
                                              // ),
                                              Text('Size',
                                                  style: TextStyle(
                                                      fontFamily: 'Nexa',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {},
                                                child: Material(
                                                    elevation: 5.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Text(
                                                        'S',
                                                        style: TextStyle(
                                                            fontFamily: 'Nexa'),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Material(
                                                    elevation: 5.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Text(
                                                        'M',
                                                        style: TextStyle(
                                                            fontFamily: 'Nexa'),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Material(
                                                    elevation: 5.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Text(
                                                        'L',
                                                        style: TextStyle(
                                                            fontFamily: 'Nexa'),
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Material(
                                                    elevation: 5.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      child: Text(
                                                        'XL',
                                                        style: TextStyle(
                                                            fontFamily: 'Nexa'),
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text('Quantity',
                                                  style: TextStyle(
                                                      fontFamily: 'Nexa',
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Material(
                                                  elevation: 5.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  child: IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: null)),
                                              SizedBox(
                                                width: 20.0,
                                              ),
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                    fontFamily: 'Nexa',
                                                    fontSize: 18.0),
                                              ),
                                              SizedBox(
                                                width: 20.0,
                                              ),
                                              Material(
                                                  elevation: 5.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  child: IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: null))
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              height: 60,
                                              child: Material(
                                                elevation: 5.0,
                                                color: Color(myyellow),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.shopping_basket,
                                                      color: Colors.white60,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Add to Cart',
                                                      style: TextStyle(
                                                          fontFamily: 'Nexa',
                                                          color: Colors.white60,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
