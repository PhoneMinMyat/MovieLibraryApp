import 'package:flutter/material.dart';
import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';

class BestActorViewItem extends StatelessWidget {
  const BestActorViewItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: MARGIN_MEDIUM_2x),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Stack(
        children: const [
          Positioned.fill(
            child: ActorImageView(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: FavouriteIconView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ActorNameAndLikeView(),
          )
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  const ActorImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://images.squarespace-cdn.com/content/v1/5f58b0094108a94a07e7dbd2/1632133685347-ZUAF7GIW5G6Z3JCRSKDE/LDC+Image+for+web.jpg',
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
  const ActorNameAndLikeView({
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
          const Text(
            'Leonardo DiCaprio',
            style: TextStyle(
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
