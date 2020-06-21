import 'package:flutter/material.dart';
import 'package:shoppingapp2/app_consts/app_var.dart';

class CartCard extends StatefulWidget {
  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        borderRadius: BorderRadius.circular(20.0),
        elevation: 5.0,
        color: Color(mywhite1),
        child: Row(
          children: <Widget>[
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
                image: DecorationImage(
                    image: AssetImage(saree5), fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Product name',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
                Text(
                  'Size: XS',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Rs 1200',
                  style: TextStyle(
                      fontFamily: 'Nexa',
                      color: Color(myyellow),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: 50.0),
            Column(
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.add,
                      size: 15,
                      color: Colors.black45,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '1',
                  style: TextStyle(
                    fontFamily: 'Nexa',
                  ),
                ),
                SizedBox(height: 5.0),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.remove,
                      size: 15,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
