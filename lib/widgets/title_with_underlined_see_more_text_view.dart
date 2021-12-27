import 'package:flutter/material.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:movie_app/widgets/underlined_seemore_text.dart';

class TitleWithUnderlinedSeeMoreText extends StatelessWidget {
  final String titleText;
  final String seemoreText;
  final bool seeMoreVisibility;
  const TitleWithUnderlinedSeeMoreText(
      {required this.titleText,
      required this.seemoreText,
      this.seeMoreVisibility = true,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TitleText(text: titleText),
        const Spacer(),
        Visibility(
            visible: seeMoreVisibility,
            child: UnderlinedSeeMoreText(text: seemoreText))
      ],
    );
  }
}
