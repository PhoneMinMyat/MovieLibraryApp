import 'package:flutter/material.dart';
import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: HOME_SCREEN_LIST_TITLE_COLOR,
          fontSize: TEXT_REGULAR,
          fontWeight: FontWeight.bold),
    );
  }
}
