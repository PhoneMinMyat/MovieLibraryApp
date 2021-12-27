import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  final Function movieOnTap;
  const MovieView(this.movieOnTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              movieOnTap();
            },
            child: Image.network(
              'https://media.elcinema.com/uploads/_315x420_98e60fdd40fdae76bda6476dc2b0671b9833c1db655a53d45ad37cc3f5745ccf.jpg',
              fit: BoxFit.fill,
              height: MOVIE_VIEW_HEIGHT,
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          const Text(
            'The Longest Day',
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2x,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: const [
              Text(
                '7.8',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              RatingView(),
            ],
          )
        ],
      ),
    );
  }
}
