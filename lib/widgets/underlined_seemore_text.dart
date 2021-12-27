import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';

class UnderlinedSeeMoreText extends StatelessWidget {
  final String text;
  final Color textColor;
  const UnderlinedSeeMoreText(
      {required this.text, this.textColor = Colors.white, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: TEXT_REGULAR,
          decoration: TextDecoration.underline,
          color: textColor,
          fontWeight: FontWeight.w600),
    );
  }
}
