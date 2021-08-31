import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/constants.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating.dart';

class RecentRestaurant extends StatelessWidget {
  const RecentRestaurant({Key key}) : super(key: key);

  Widget buildResListView(BuildContext context, Restaurant res) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RestaurantScreen(
                    restaurant: res,
                  ))),
      child: Container(
        margin: EdgeInsets.only(bottom: 15.0, right: 10.0),
        width: 500.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(width: 1.0, color: Colors.grey[300])),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Hero(
                tag: res.imageUrl,
                child: Image(
                  image: AssetImage(res.imageUrl),
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    res.name,
                    style: kContentBoldTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RatingStar(rating: res.rating),
                  Text(
                    res.address,
                    style: kContentW600TextStyle.copyWith(fontSize: 16.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '0.2 miles away',
                    style: kContentW600TextStyle.copyWith(fontSize: 16.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 10.0, 10.0, 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nearby Restaurants',
            style: kTitleTextStyle,
          ),
          Container(
            width: 500.0,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: restaurants.length,
                itemBuilder: (context, index) =>
                    buildResListView(context, restaurants[index])),
          ),
        ],
      ),
    );
  }
}
