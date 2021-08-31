import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/constants.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/widgets/rating.dart';
import 'package:flutter_food_delivery_ui/widgets/restaurant_food_list.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key key, @required this.restaurant})
      : super(key: key);

  static final routeID = '/restaurant';
  final Restaurant restaurant;

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            Hero(
              tag: widget.restaurant.imageUrl,
              child: Image(
                image: AssetImage(widget.restaurant.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white70,
                    size: 25.0,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ]),
          Container(
            // height: 500,
            width: 100,
            // color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: kContentBoldTextStyle,
                    ),
                    Text(
                      '0.2 miles away',
                      style: kContentW600TextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                RatingStar(rating: widget.restaurant.rating),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: kContentW600TextStyle,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Reviews',
                            style: kContentW600TextStyle,
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Contact',
                            style: kContentW600TextStyle,
                          )),
                    ],
                  ),
                ),
                Center(
                    child: Text(
                  'Menu',
                  style: kContentBoldTextStyle.copyWith(fontSize: 25.0),
                )),
                SizedBox(
                  height: 10.0,
                ),
                FoodList(restaurant: widget.restaurant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
