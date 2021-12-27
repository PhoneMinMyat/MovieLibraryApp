import 'package:flutter/material.dart';

import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/play_button_view.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned.fill(
          child: BannerImageView(),
        ),
        Positioned.fill(
          child: GradientView(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: BannerTitleSectionView(),
        ),
        Align(
          alignment: Alignment.center,
          child: PlayButtonView(),
        )
      ],
    );
  }
}



class BannerTitleSectionView extends StatelessWidget {
  const BannerTitleSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'The Wolverine 2013.',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: TEXT_HEADING),
          ),
          Text(
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
  const BannerImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/25/09/The-Wolverine.jpg?width=1200&auto=webp&quality=75',
      fit: BoxFit.cover,
    );
  }
}
