import 'package:flutter/material.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/widgets/play_button_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class ShowCaseViewItem extends StatelessWidget {
  const ShowCaseViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2x),
      width: SHOWCASE_WIDTH,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/81f630300cf9006de9041c854439073ddecc6eac6db9bc0a1512b439648a478d._UY500_UX667_RI_V_TTW_.jpg',
              fit: BoxFit.cover,
            ),
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
                children: const [
                  Text(
                    'Passengers',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: TEXT_REGULAR_3x),
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  TitleText(text: '15 DECEMBER 2016')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
