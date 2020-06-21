import 'package:flutter/material.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';
import 'package:shoppingapp2/widgets/cart_card.dart';

class ShoppingCart extends StatefulWidget {
  static String id = 'cart';
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade300,
          iconTheme: new IconThemeData(color: Colors.black38),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Center(
                    child: Text(
                  'Bag',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ))),
            Expanded(
              flex: 6,
              child:

                  // ListView.builder(
                  //   itemCount: 2,
                  //   itemBuilder: (context,index){
                  //     return Dismissible(
                  //       key: Key(index),
                  //       child: CartCard()

                  //       );
                  //   }

                  //   )

                  ListView(
                children: <Widget>[
                  CartCard(),
                  CartCard(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          //color: Colors.grey.shade300,
          height: 150.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'SubTotal:',
                      style: TextStyle(fontFamily: 'Nexa', color: Colors.black45,fontSize: 18),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      ' Rs 2300',
                      style: TextStyle(
                          fontFamily: 'Nexa', fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black45),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: Material(
                    elevation: 5.0,
                    color: Color(myyellow),
                    borderRadius: BorderRadius.circular(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Proceed to Checkout',
                          style: TextStyle(
                              fontFamily: 'Nexa',
                              color: Colors.white60,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
