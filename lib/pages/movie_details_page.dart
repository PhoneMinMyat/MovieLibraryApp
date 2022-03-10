import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';

import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/string.dart';
import 'package:movie_app/widgets/actors_and_creators_view.dart';
import 'package:movie_app/widgets/gradient_view.dart';
import 'package:movie_app/widgets/image_network_with_placeholder.dart';
import 'package:movie_app/widgets/rating_view.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:scoped_model/scoped_model.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;

  const MovieDetailsPage({required this.movieId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: CustomScrollView(
          slivers: [
            // MovieDetailSliverAppBarSectionView(
            //     () {
            //       Navigator.pop(context);
            //     },
            //     movie: model.mMovie,
            //   ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
                  // child:  TrailerSection(
                  //     genreList: model.mMovie?.getGenreListAsStringList() ?? [],
                  //     storyLine: model.mMovie?.overview ?? '',
                  //     runtime: model.mMovie?.getRunTimeAsFormattedString() ?? '',
                  //   ),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2x,
                ),
                // ActorsAndCreatorsView(
                //     titleText: MOVIE_DETAIL_SCREEN_ACTORS_SECTION_TITLE,
                //     seeMoreText: '',
                //     isSeeMoreVisible: false,
                //     actorList: model.mCast,
                //   ),
                const SizedBox(
                  height: MARGIN_LARGE,
                ),
                // AboutInfoSectionView(
                //     movie: model.mMovie,
                //   ),
                const SizedBox(
                  height: MARGIN_LARGE,
                ),
                // ActorsAndCreatorsView(
                //     titleText: MOVIE_DETAIL_SCREEN_CREATORS_SECTION_TITLE,
                //     seeMoreText: MOVIE_DETAIL_SCREEN_CREATORS_SECTION_SEE_MORE,
                //     actorList: model.mCrew,
                //   ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutInfoSectionView extends StatelessWidget {
  final MovieVO? movie;
  const AboutInfoSectionView({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(text: MOVIE_DETAIL_SCREEN_ABOUT_FILM_TITLE),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Original Title:',
            descriptionText: movie?.originalTitle ?? '',
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Type:',
            descriptionText: movie?.getGenreAsCommaSeparatedString() ?? '',
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Company:',
            descriptionText:
                movie?.getProductionCompanyAsCommaSeparatedString() ?? '',
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Production:',
            descriptionText:
                movie?.getProductionCountryAsCommaSeparatedString() ?? '',
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Premiere:',
            descriptionText: movie?.releaseDate ?? '',
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          AboutFilmInfoView(
            infoText: 'Description:',
            descriptionText: movie?.overview ?? '',
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
        SizedBox(
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
  final String storyLine;
  final String runtime;

  const TrailerSection({
    Key? key,
    required this.genreList,
    required this.storyLine,
    required this.runtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieTimeAndGenreSection(
          genreList: genreList,
          runtime: runtime,
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_3x,
        ),
        StorylineView(
          storyLineText: storyLine,
        ),
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
  final String storyLineText;
  const StorylineView({
    required this.storyLineText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(text: MOVIE_DETAIL_SCREEN_STORYLINE_TITLE),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          storyLineText,
          style:
              const TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2x),
        )
      ],
    );
  }
}

class MovieTimeAndGenreSection extends StatelessWidget {
  final String runtime;
  const MovieTimeAndGenreSection({
    required this.runtime,
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
        Text(
          runtime,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
  final MovieVO? movie;
  const MovieDetailSliverAppBarSectionView(
    this.backOnTap, {
    required this.movie,
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
          Positioned.fill(
            child: SliverAppBarMovieImageView(
              imageUrl: movie?.backdropPath ?? '',
            ),
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2x,
                  right: MARGIN_MEDIUM_2x,
                  bottom: MARGIN_LARGE),
              child: MovieDetailPageAppBarInfoView(
                movie: movie,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class MovieDetailPageAppBarInfoView extends StatelessWidget {
  final MovieVO? movie;
  const MovieDetailPageAppBarInfoView({
    required this.movie,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            DetailPageAppBarInfoMovieYearView(
              yearText: movie?.getReleaseYear() ?? '',
            ),
            const Spacer(),
            DetailPageAppBarInfoRatingView(
              voteAverage: movie?.voteAverage ?? 0,
              voteAverageAsString: movie?.getAverageVoteAsCommaVersion() ?? '',
              voteCount: movie?.voteCount ?? 0,
            )
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          movie?.title ?? '',
          style: const TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_2X,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class DetailPageAppBarInfoRatingView extends StatelessWidget {
  final int voteCount;
  final double voteAverage;
  final String voteAverageAsString;
  const DetailPageAppBarInfoRatingView({
    required this.voteCount,
    required this.voteAverageAsString,
    required this.voteAverage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            RatingView(
              rating: voteAverage,
            ),
            const SizedBox(
              height: MARGIN_SMALL,
            ),
            TitleText(text: '$voteCount VOTES'),
            const SizedBox(
              height: MARGIN_CARD_MEDIUM_2,
            )
          ],
        ),
        Text(
          voteAverageAsString,
          style: const TextStyle(
              color: Colors.white,
              fontSize: MOVIE_DETAILS_SCREEN_APP_BAR_FONT_SIZE),
        ),
      ],
    );
  }
}

class DetailPageAppBarInfoMovieYearView extends StatelessWidget {
  final String yearText;
  const DetailPageAppBarInfoMovieYearView({
    required this.yearText,
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
      child: Center(
        child: Text(
          yearText,
          style: const TextStyle(
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
  final String imageUrl;
  const SliverAppBarMovieImageView({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageNetworkWithPlaceHolder(
      imageUrl: '$IMAGE_BASE_URL$imageUrl',
    );
  }
}
