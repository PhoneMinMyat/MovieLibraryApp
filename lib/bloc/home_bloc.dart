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
    mMovieModel.getNowPlayingMoviesFromDatabase().then((movieList) {
      mNowPlayingStreamController.sink.add(movieList);
    }).catchError((error) {});

    ///Popular Movies
    mMovieModel.getPopularMoviesFromDatabase().then((movieList) {
      mPopularMoviesStreamController.sink.add(movieList);
    }).catchError((error) {});

    ///Top rated Movies
    mMovieModel.getTopRatedMoviesFromDatabase().then((movieList) {
      mTopRatedStreamController.sink.add(movieList);
    }).catchError((error) {});

    ///Genres
    mMovieModel.getGenresFromDatabase().then((genreList) {
      mGenreListStreamController.sink.add(genreList);

      ///Movies By Genres
      _getMoviesByGenreAndRefresh(genreList.first.id ?? -1);
    }).catchError((error) {});

    ///Actors
    mMovieModel.getActorsFromDatabase().then((actorList) {
      mActorListStreamController.sink.add(actorList);
    }).catchError((error) {});
  }

  void onTapGenre(int genreId){
    _getMoviesByGenreAndRefresh(genreId);
  }

  void _getMoviesByGenreAndRefresh(int genreId) {
    mMovieModel.getMoviesByGenre(genreId).then((movieList) {
      mMoviesByGenreListStreamController.sink.add(movieList ?? []);
    }).catchError((error) {});
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
