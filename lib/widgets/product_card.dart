import 'package:flutter/material.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';
import 'package:shoppingapp2/views/product_details.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  ProductCard({this.image, this.name, this.price});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsPage(
          image: widget.image,
          name: widget.name,
          price: widget.price,
        )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        //padding: EdgeInsets.only(right: 10.0),
        height: 200,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 60.0,
              decoration: BoxDecoration(color: Colors.white38.withOpacity(0.9)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Prod',
                    style:
                        TextStyle(fontFamily: 'Nexa', color: Color(myyellow)),
                  ),
                  Text(
                    'Price',
                    style:
                        TextStyle(fontFamily: 'Nexa', color: Color(myyellow)),
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(myyellow),
                        ),
                        onPressed: null),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
