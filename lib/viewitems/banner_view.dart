import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';

import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/image_network_with_placeholder.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  final MovieVO? movie;
  const BannerView({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(
            imageUrl: movie?.backdropPath ?? '',
          ),
        ),
        const Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleSectionView(
            title: movie?.title ?? '',
          ),
        ),
        const Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        )
      ],
    );
  }
}

class BannerTitleSectionView extends StatelessWidget {
  final String title;
  const BannerTitleSectionView({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_HEADING),
          ),
          const Text(
            'Official Review',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_HEADING),
          ),
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  final String imageUrl;
  const BannerImageView({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageNetworkWithPlaceHolder(imageUrl: '$IMAGE_BASE_URL$imageUrl');
  }
}
