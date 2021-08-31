import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class FoodList extends StatelessWidget {
  const FoodList({Key key, @required this.restaurant}) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: List.generate(
          restaurant.menu.length,
          (index) => Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(restaurant.menu[index].imageUrl),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue),
                    margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                  ),
                  Container(
                    width: 250.0,
                    margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [
                            0.1,
                            0.4,
                            0.7,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black87.withOpacity(0.3),
                            Colors.black54.withOpacity(0.3),
                            Colors.black38.withOpacity(0.3),
                          ]),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.menu[index].name,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        restaurant.menu[index].price.toString(),
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 10.0,
                    right: 10.0,
                    child: Container(
                      margin: EdgeInsets.only(right: 5.0, bottom: 5.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 25.0,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ],
              )),
    );
  }
}


// Container(
//                       margin: EdgeInsets.only(right: 10.0),
//                       width: 50.0,
//                       height: 50.0,
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor,
//                         borderRadius: BorderRadius.circular(50.0),
//                       ),
//                       child: IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.add,
//                             size: 25.0,
//                             color: Colors.white,
//                           )),
//                     )