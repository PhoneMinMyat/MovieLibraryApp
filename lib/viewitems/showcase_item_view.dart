import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/image_network_with_placeholder.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseViewItem extends StatelessWidget {
  final MovieVO movie;
  const ShowCaseViewItem({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2x),
      width: SHOWCASE_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
            child: ImageNetworkWithPlaceHolder(imageUrl: '$IMAGE_BASE_URL${movie.backdropPath}')
          ),
          const Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2x),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    movie.title ?? '',
                    style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: TEXT_REGULAR_3x),
                  ),
                const  SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  TitleText(text: movie.releaseDate ?? '')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
