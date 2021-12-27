import 'package:flutter/material.dart';
import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/viewitems/best_actor_view.dart';
import 'package:movie_app/widgets/title_with_underlined_see_more_text_view.dart';

class ActorsAndCreatorsView extends StatelessWidget {
  final String titleText;
  final String seeMoreText;
  final bool isSeeMoreVisible;
  const ActorsAndCreatorsView(
      {required this.titleText,
      required this.seeMoreText,
      this.isSeeMoreVisible = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      padding: const EdgeInsets.only(top: MARGIN_LARGE, bottom: MARGIN_XXLARGE),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            child: TitleWithUnderlinedSeeMoreText(
              titleText: titleText,
              seemoreText: seeMoreText,
              seeMoreVisibility: isSeeMoreVisible,
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          Container(
            height: MOVIE_VIEW_HEIGHT,
            child: ListView(
              padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
              scrollDirection: Axis.horizontal,
              children: const [
                BestActorViewItem(),
                BestActorViewItem(),
                BestActorViewItem(),
                BestActorViewItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
