import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDisplayWidgetHome2 extends StatelessWidget {
  final double
      rating; // The rating value you want to display (e.g., 3.5, 4.0, etc.)

  RatingDisplayWidgetHome2({required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: const Color.fromARGB(255, 184, 52, 207),
      ),
      itemCount: 5,
      itemSize: 15.0,
      direction: Axis.horizontal,
    );
  }
}
