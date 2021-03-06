import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/pages/movie_details_page.dart';
import 'package:movie_app/resources/color.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/resources/string.dart';
import 'package:movie_app/viewitems/banner_view.dart';
import 'package:movie_app/viewitems/movie_view.dart';
import 'package:movie_app/viewitems/showcase_item_view.dart';
import 'package:movie_app/widgets/actors_and_creators_view.dart';
import 'package:movie_app/widgets/title_text.dart';
import 'package:movie_app/widgets/title_with_underlined_see_more_text_view.dart';
import 'package:movie_app/widgets/underlined_seemore_text.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: APPBAR_ELEVATION,
        backgroundColor: PRIMARY_COLOR,
        centerTitle: true,
        title: const Text(
          HOMEPAGE_APPBAR_TITLE,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2x),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: Container(
        color: HOME_SCREEN_BACKGROUND_COLOR,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScopedModelDescendant<MovieModelImpl>(
                builder: (context, child, model) {
                  return BannerSectionView(
                      movieList:
                          model.mPopularMovieList?.take(5).toList() ?? []);
                },
              ),
              const SizedBox(height: MARGIN_MEDIUM_2x),
              ScopedModelDescendant<MovieModelImpl>(
                builder: (context, child, model) {
                  return BestPopularFilmsAndSerialsSectionView(
                    (movieId) => navigationToMovieDetailsPage(context, movieId, model),
                    getNowPlayingMovieList: model.mNowPlayingMovieList,
                  );
                },
              ),
              const SizedBox(height: MARGIN_MEDIUM_2x),
              const CheckMovieShowTimeSectionView(),
              const SizedBox(height: MARGIN_LARGE),
              ScopedModelDescendant<MovieModelImpl>(
                builder: (context, child, model) {
                  return GenreSectionView(
                    (movieId) => navigationToMovieDetailsPage(context, movieId, model),
                    genreList: model.mGenresList,
                    movieList: model.mMoviesByGenreList,
                    chooseGenre: (genreId) {
                      if (genreId != null) {
                        model.getMoviesByGenre(genreId);
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: MARGIN_LARGE),
              ScopedModelDescendant<MovieModelImpl>(
                builder: (context, child, model) {
                  return ShowCaseSectionView(
                    movieList: model.mTopRatedMovieList ?? [],
                  );
                },
              ),
              const SizedBox(height: MARGIN_LARGE),
              ScopedModelDescendant<MovieModelImpl>(
                builder: (context, child, model) {
                  return ActorsAndCreatorsView(
                    titleText: BEST_ACTOR_TITLE,
                    seeMoreText: BEST_ACTOR_SEE_MORE,
                    actorList: model.mActorsList ?? [],
                  );
                },
              ),
              //const SizedBox(height: MARGIN_LARGE),
            ],
          ),
        ),
      ),
    );
  }

  void navigationToMovieDetailsPage(BuildContext context, int? movieId, MovieModelImpl model) {
    if (movieId != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(
            movieId: movieId,
          ),
        ),
      );
      model.getCreditByMovie(movieId);
      model.getMovieDetails(movieId);
      model.getMovieDetailsFromDatabase(movieId);
    }
  }
}

class CheckMovieShowTimeSectionView extends StatelessWidget {
  const CheckMovieShowTimeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      height: MOVIE_SHOWTIME_HEIGHT,
      padding: const EdgeInsets.all(MARGIN_LARGE),
      margin: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                HOMEPAGE_CHECK_MOVIE_SHOW_TIME,
                style: TextStyle(color: Colors.white, fontSize: TEXT_HEADING),
              ),
              Spacer(),
              UnderlinedSeeMoreText(
                text: HOMEPAGE_SEE_MORE,
                textColor: PLAYBUTTON_COLOR,
              )
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.location_on_rounded,
            color: Colors.white,
            size: PLAYBUTTON_SIZE,
          )
        ],
      ),
    );
  }
}

class ShowCaseSectionView extends StatelessWidget {
  final List<MovieVO>? movieList;
  const ShowCaseSectionView({
    required this.movieList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
          child: TitleWithUnderlinedSeeMoreText(
            titleText: SHOWCASE_TITLE,
            seemoreText: SHOWCASE_SEE_MORE,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        SizedBox(
          height: SHOWCASE_HEIGHT,
          child: ListView(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
            scrollDirection: Axis.horizontal,
            children: movieList
                    ?.map((movie) => ShowCaseViewItem(movie: movie))
                    .toList() ??
                [],
          ),
        ),
      ],
    );
  }
}

class GenreSectionView extends StatelessWidget {
  const GenreSectionView(this.movieOnTap,
      {required this.genreList,
      required this.movieList,
      required this.chooseGenre,
      Key? key})
      : super(key: key);

  final List<GenreVO>? genreList;
  final List<MovieVO>? movieList;
  final Function(int?) movieOnTap;
  final Function(int?) chooseGenre;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN_MEDIUM_2x,
          ),
          child: DefaultTabController(
            length: genreList?.length ?? 0,
            child: TabBar(
              isScrollable: true,
              labelColor: HOME_SCREEN_LIST_TITLE_COLOR,
              indicatorColor: PLAYBUTTON_COLOR,
              tabs: genreList
                      ?.map((genre) => Tab(
                            child: Text(genre.name ?? ''),
                          ))
                      .toList() ??
                  [],
              onTap: (index) {
                chooseGenre(genreList?[index].id ?? 0);
              },
            ),
          ),
        ),
        Container(
          color: PRIMARY_COLOR,
          padding: const EdgeInsets.only(
              top: MARGIN_MEDIUM_2x, bottom: MARGIN_MEDIUM_2x),
          child: HorizontalMovieListView(
            (movieId) => movieOnTap(movieId),
            movieList: movieList,
          ),
        ),
      ],
    );
  }
}

class BestPopularFilmsAndSerialsSectionView extends StatelessWidget {
  final Function(int?) movieOnTap;
  final List<MovieVO>? getNowPlayingMovieList;
  const BestPopularFilmsAndSerialsSectionView(
    this.movieOnTap, {
    required this.getNowPlayingMovieList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
            child:
                const TitleText(text: HOMEPAGE_BEST_POPULAR_FILMS_AND_SERIALS)),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        HorizontalMovieListView(
          (movieId) => movieOnTap(movieId),
          movieList: getNowPlayingMovieList,
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function(int?) movieOnTap;
  final List<MovieVO>? movieList;
  const HorizontalMovieListView(
    this.movieOnTap, {
    required this.movieList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (movieList != null)
        ? SizedBox(
            height: MOVIE_LIST_HEIGHT,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
                itemCount: movieList?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => movieOnTap(movieList?[index].id),
                    child: MovieView(
                      movie: movieList?[index],
                    ),
                  );
                }),
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class BannerSectionView extends StatefulWidget {
  final List<MovieVO>? movieList;

  const BannerSectionView({
    required this.movieList,
    Key? key,
  }) : super(key: key);

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: widget.movieList
                    ?.map((movie) => BannerView(
                          movie: movie,
                        ))
                    .toList() ??
                [],
          ),
        ),
        DotsIndicator(
          dotsCount: (widget.movieList?.length == 0)
              ? 1
              : widget.movieList?.length ?? 1,
          position: _position,
          decorator: const DotsDecorator(
            color:
                HOME_SCREEN_BANNER_INDICATOR_DOTS_INACTIVE_COLOR, // Inactive color
            activeColor: PLAYBUTTON_COLOR,
          ),
        )
      ],
    );
  }
}
