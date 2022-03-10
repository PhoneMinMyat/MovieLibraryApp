import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/image_network_with_placeholder.dart';
import 'package:movie_app/widgets/rating_view.dart';

class MovieView extends StatelessWidget {
  final MovieVO? movie;
  const MovieView({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageNetworkWithPlaceHolder(
              imageUrl: '$IMAGE_BASE_URL${movie?.posterPath ?? ""}'),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            movie?.title ?? '',
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: TEXT_REGULAR_2x,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Text(
                movie?.voteAverage.toString() ?? '',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: MARGIN_MEDIUM,
              ),
              RatingView(
                rating: movie?.voteAverage ?? 0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
