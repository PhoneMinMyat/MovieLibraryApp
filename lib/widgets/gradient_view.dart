import 'package:flutter/material.dart';
import 'package:movie_app/resources/color.dart';

class GradientView extends StatelessWidget {
  const GradientView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.transparent, HOME_SCREEN_BACKGROUND_COLOR],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
    );
  }
}