import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  final Function movieOnTap;
  final MovieVO? movie;
  const MovieView(this.movieOnTap, {required this.movie, Key? key})
      : super(key: key);

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
              '$IMAGE_BASE_URL${movie?.posterPath}',
              fit: BoxFit.fill,
              height: MOVIE_VIEW_HEIGHT,
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            movie?.title ?? '',
            style: const TextStyle(
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
