import 'package:flutter/material.dart';
import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';

class PlayButtonView extends StatelessWidget {
  const PlayButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.play_circle,
        size: PLAYBUTTON_SIZE,
        color: PLAYBUTTON_COLOR,
      ),
    );
  }
}