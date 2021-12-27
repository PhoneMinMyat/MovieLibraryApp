import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/resources/dimens.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        itemSize: MARGIN_MEDIUM_2x,
        initialRating: 7.8/2,
        allowHalfRating: true,
        ignoreGestures: true,
        unratedColor: Colors.black,
        itemBuilder: (BuildContext context, int index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (rating) {});
  }
}
