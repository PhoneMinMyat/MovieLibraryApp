import 'dart:async';

import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class HomeBloc {
  ///Reactive Streams
  StreamController<List<MovieVO>> mNowPlayingStreamController =
      StreamController();
  StreamController<List<MovieVO>> mPopularMoviesStreamController =
      StreamController();
  StreamController<List<MovieVO>> mTopRatedStreamController =
      StreamController();
  StreamController<List<GenreVO>> mGenreListStreamController =
      StreamController();
  StreamController<List<ActorVO>> mActorListStreamController =
      StreamController();
  StreamController<List<MovieVO>> mMoviesByGenreListStreamController =
      StreamController();

  ///MovieModel
  MovieModel mMovieModel = MovieModelImpl();

  HomeBloc() {
    ///Now Playing
    mMovieModel.getNowPlayingMoviesFromDatabase().listen((movieList) {
      mNowPlayingStreamController.sink.add(movieList);
    }).onError((error) {});

    ///Popular Movies
    mMovieModel.getPopularMoviesFromDatabase().listen((movieList) {
      mPopularMoviesStreamController.sink.add(movieList);
    }).onError((error) {});

    ///Top rated Movies
    mMovieModel.getTopRatedMoviesFromDatabase().listen((movieList) {
      mTopRatedStreamController.sink.add(movieList);
    }).onError((error) {});
  }

  void dispose() {
    mNowPlayingStreamController.close();
    mPopularMoviesStreamController.close();
    mTopRatedStreamController.close();
    mGenreListStreamController.close();
    mActorListStreamController.close();
    mMoviesByGenreListStreamController.close();
  }
}
