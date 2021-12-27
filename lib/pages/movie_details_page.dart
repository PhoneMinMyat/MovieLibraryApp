import 'package:flutter/material.dart';

import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/string.dart';
import 'package:movie_app/widgets/actors_and_creators_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/rating_view.dart';
import 'package:movie_app/widgets/title_text.dart';

class MovieDetailsPage extends StatelessWidget {
  final List<String> genreList = [
    'War',
    'History',
    'Classic',
    'Action',
    'World War II'
  ];
  MovieDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailSliverAppBarSectionView(() {
              Navigator.pop(context);
            }),
            SliverList(

              delegate: SliverChildListDelegate([
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  child: TrailerSection(
                    genreList: genreList,
                  ),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                const ActorsAndCreatorsView(
                  titleText: MOVIE_DETAIL_SCREEN_ACTORS_SECTION_TITLE,
                  seeMoreText: '',
                  isSeeMoreVisible: false,
                ),
                const SizedBox(
                  height: MARGIN_LARGE,
                ),
                const AboutInfoSectionView(),
                const SizedBox(
                  height: MARGIN_LARGE,
                ),
                const ActorsAndCreatorsView(
                  titleText: MOVIE_DETAIL_SCREEN_CREATORS_SECTION_TITLE,
                  seeMoreText: MOVIE_DETAIL_SCREEN_CREATORS_SECTION_SEE_MORE,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutInfoSectionView extends StatelessWidget {
  const AboutInfoSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TitleText(text: MOVIE_DETAIL_SCREEN_ABOUT_FILM_TITLE),
          SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Original Title:',
            descriptionText: 'The Longest Day',
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Type:',
            descriptionText: 'War, History, Classic',
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Production:',
            descriptionText: 'United Kingdom, USA',
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Premiere:',
            descriptionText: '4 October 1962 (USA)',
          ),
          SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Description:',
            descriptionText:
                'In 1944, the U.S. Army and Allied forces plan a huge invasion landing in Normandy, France. Despite bad weather, General Eisenhower gives the okay and the Allies land at Normandy. General Norma Cota (Robert Mitchum) travels with his men onto Omaha Beach. With much effort, and lost life, they get off the beach, traveling deep into French territory. The German military, due to arrogance, ignorance and a sleeping Adolf Hitler, delay their response to the Allied landing, with crippling results.',
          ),
        ],
      ),
    );
  }
}

class AboutFilmInfoView extends StatelessWidget {
  final String infoText;
  final String descriptionText;
  const AboutFilmInfoView({
    Key? key,
    required this.infoText,
    required this.descriptionText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Text(
            infoText,
            style: const TextStyle(
                color: DETAILS_SCREEN_ABOUT_FILM_INFO_COLOR,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM_2x,
        ),
        Expanded(
          child: Text(
            descriptionText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class TrailerSection extends StatelessWidget {
  final List<String> genreList;

  const TrailerSection({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreSection(genreList: genreList),
        const SizedBox(
          height: MARGIN_MEDIUM_3x,
        ),
        const StorylineView(),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        Row(
          children: const [
            MovieDetailsScreenButtonView(
              text: MOVIE_DETAIL_SCREEN_PLAY_TRAILER_BUTTON_TEXT,
              icon: Icon(
                Icons.play_circle,
                color: Colors.black54,
              ),
              backgroundColor: PLAYBUTTON_COLOR,
            ),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
            MovieDetailsScreenButtonView(
              text: MOVIE_DETAIL_SCREEN_RATE_MOVIE_BUTTON_TEXT,
              icon: Icon(
                Icons.star,
                color: PLAYBUTTON_COLOR,
              ),
              backgroundColor: Colors.transparent,
              isGhostButton: true,
            ),
          ],
        )
      ],
    );
  }
}

class MovieDetailsScreenButtonView extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color backgroundColor;
  final bool isGhostButton;
  const MovieDetailsScreenButtonView({
    Key? key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    this.isGhostButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XXLARGE,
      padding: const EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(MARGIN_LARGE),
          border: (isGhostButton)
              ? Border.all(width: 2, color: Colors.white)
              : null),
      child: Center(
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: MARGIN_SMALL,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontSize: TEXT_REGULAR_2x),
            ),
          ],
        ),
      ),
    );
  }
}

class StorylineView extends StatelessWidget {
  const StorylineView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TitleText(text: MOVIE_DETAIL_SCREEN_STORYLINE_TITLE),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          'Shot in a docudrama style (with captions identifying the different participants), the film opens in the days leading up to D-Day, concentrating on events on both sides of the English channel. The Allies wait for a break in the poor weather while anticipating the reaction of the Axis forces defending northern France. As Supreme Commander of SHAEF, Gen. Dwight Eisenhower makes the decision to go after reviewing the initial bad weather reports and the reports about the divisions within the German High Command as to where an invasion might happen and what should be their response.',
          style: TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2x),
        )
      ],
    );
  }
}

class MovieTimeAndGenreSection extends StatelessWidget {
  const MovieTimeAndGenreSection({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,

      children: [
        const Icon(
          Icons.access_time,
          color: PLAYBUTTON_COLOR,
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        const Text(
          '2h 58min',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        ...genreList
            .map((genre) => GenreChip(
                  labelText: genre,
                ))
            .toList(),
        // const Spacer(),
        const Icon(
          Icons.favorite_outline,
          color: Colors.white,
        )
      ],
    );
  }
}

class GenreChip extends StatelessWidget {
  final String labelText;
  const GenreChip({
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Chip(
          label: Text(
            labelText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: DETAILS_SCREEN_CHIP_COLOR,
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        )
      ],
    );
  }
}

class MovieDetailSliverAppBarSectionView extends StatelessWidget {
  final Function backOnTap;
  const MovieDetailSliverAppBarSectionView(
    this.backOnTap, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: MOVIE_DETAILS_SCREEN_SLIVER_APP_BAR_HEIGHT,
      backgroundColor: PRIMARY_COLOR,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(children: [
          const Positioned.fill(
            child: SliverAppBarMovieImageView(),
          ),
          const Positioned.fill(child: GradientView()),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2x, top: MARGIN_XXLARGE),
              child: BackButtonView(() => backOnTap()),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                  right: MARGIN_MEDIUM_2x, top: MARGIN_XXLARGE + MARGIN_MEDIUM),
              child: SearchIconButtonView(),
            ),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MARGIN_MEDIUM_2x,
                  right: MARGIN_MEDIUM_2x,
                  bottom: MARGIN_LARGE),
              child: MovieDetailPageAppBarInfoView(),
            ),
          )
        ]),
      ),
    );
  }
}

class MovieDetailPageAppBarInfoView extends StatelessWidget {
  const MovieDetailPageAppBarInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            DetailPageAppBarInfoMovieYearView(),
            Spacer(),
            DetailPageAppBarInfoRatingView()
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const Text(
          'The Longest Day',
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_2X,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DetailPageAppBarInfoRatingView extends StatelessWidget {
  const DetailPageAppBarInfoRatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: const [
            RatingView(),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            TitleText(text: '38876 VOTES'),
            SizedBox(
              height: MARGIN_CARD_MEDIUM_2,
            )
          ],
        ),
        const Text(
          '9,75',
          style: TextStyle(
              color: Colors.white,
              fontSize: MOVIE_DETAILS_SCREEN_APP_BAR_FONT_SIZE),
        ),
      ],
    );
  }
}

class DetailPageAppBarInfoMovieYearView extends StatelessWidget {
  const DetailPageAppBarInfoMovieYearView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XXLARGE,
      decoration: BoxDecoration(
          color: PLAYBUTTON_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_LARGE)),
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
      child: const Center(
        child: Text(
          '2016',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: TEXT_REGULAR_2x,
              color: Colors.white),
        ),
      ),
    );
  }
}

class SearchIconButtonView extends StatelessWidget {
  const SearchIconButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.search,
      color: Colors.white,
      size: MARGIN_XLARGE,
    );
  }
}

class BackButtonView extends StatelessWidget {
  final Function backOnTap;
  const BackButtonView(
    this.backOnTap, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => backOnTap(),
      child: Container(
        width: MARGIN_XXLARGE,
        height: MARGIN_XXLARGE,
        decoration:
            const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
        child: const Icon(
          Icons.chevron_left,
          size: MARGIN_XLARGE,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SliverAppBarMovieImageView extends StatelessWidget {
  const SliverAppBarMovieImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://cdn3.volusion.com/bxqxk.xvupj/v/vspfiles/photos/HALFSHEET167-2.jpg?v-cache=1327064021',
      fit: BoxFit.cover,
    );
  }
}
