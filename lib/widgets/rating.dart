import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  const RatingStar({Key key, @required this.rating}) : super(key: key);
  final int rating;
  @override
  Widget build(BuildContext context) {
    String strRating = '';
    for (int i = 0; i < rating; i++) {
      strRating += '⭐';
    }
    return Text(
      strRating,
      style: TextStyle(fontSize: 15.0),
    );
  }
}
