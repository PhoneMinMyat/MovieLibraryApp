import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';

class BestActorViewItem extends StatelessWidget {
  final ActorVO? actor;
  const BestActorViewItem({required this.actor, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM_2x),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children:  [
          Positioned.fill(
            child: ActorImageView(imageUrl: actor?.profilePath ?? '',),
          ),
         const Align(
            alignment: Alignment.topRight,
            child: FavouriteIconView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ActorNameAndLikeView(actorName: actor?.name ?? '',),
          )
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  final String imageUrl;
  const ActorImageView({required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '$IMAGE_BASE_URL$imageUrl',
      fit: BoxFit.cover,
    );
  }
}

class FavouriteIconView extends StatelessWidget {
  const FavouriteIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(MARGIN_MEDIUM),
      child: Icon(
        Icons.favorite_outline,
        color: Colors.white,
      ),
    );
  }
}

class ActorNameAndLikeView extends StatelessWidget {
  final String actorName;
  const ActorNameAndLikeView({required this.actorName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
           Text(
            actorName,
            style:const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: MARGIN_MEDIUM),
          Row(
            children: const [
              Icon(
                Icons.thumb_up,
                color: Colors.amber,
                size: MARGIN_CARD_MEDIUM_2,
              ),
              SizedBox(width: MARGIN_MEDIUM),
              Text(
                'YOU LIKE 15 MOVIES',
                style: TextStyle(
                    color: HOME_SCREEN_LIST_TITLE_COLOR,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}
