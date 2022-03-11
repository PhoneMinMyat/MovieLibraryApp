import 'package:flutter/foundation.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/genre_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class HomeBloc extends ChangeNotifier {
  ///Home Page State Variable
  List<MovieVO>? mNowPlayingMovieList;
  List<MovieVO>? mPopularMovieList;
  List<MovieVO>? mTopRatedMovieList;
  List<ActorVO>? mActorsList;
  List<GenreVO>? mGenresList;
  List<MovieVO>? mMoviesByGenreList;

  //MovieModel
  final MovieModel _mMovieModel = MovieModelImpl();

  HomeBloc() {
    //Now Playing
    _mMovieModel.getNowPlayingMoviesFromDatabase().then((movieList) {
      mNowPlayingMovieList = movieList;
      notifyListeners();
    }).catchError((error) {});

    //Popular Movies
    _mMovieModel.getPopularMoviesFromDatabase().then((movieList) {
      mPopularMovieList = movieList;
      notifyListeners();
    }).catchError((error) {});

    //TopRated Movies
    _mMovieModel.getTopRatedMoviesFromDatabase().then((movieList) {
      mTopRatedMovieList = movieList;
      notifyListeners();
    }).catchError((error) {});

    //Genres
    _mMovieModel.getGenresFromDatabase().then((genreList) {
      mGenresList = genreList;
      //Movies By Genres
      _mMovieModel.getMoviesByGenre(genreList.first.id ?? 0).then((movieList) {
        mMoviesByGenreList = movieList;
        notifyListeners();
      }).catchError((error) {});
      notifyListeners();
    }).catchError((error) {});

    //Actors
    _mMovieModel.getActorsFromDatabase().then((actorList) {
      mActorsList = actorList;
      notifyListeners();
    }).catchError((error) {});
  }

  void onTapGenre(int genreId) {
    _getMoviesByGenreAndRefresh(genreId);
  }

  void _getMoviesByGenreAndRefresh(int genreId) {
    _mMovieModel.getMoviesByGenre(genreId).then((movieList) {
      mMoviesByGenreList = movieList;
      notifyListeners();
    }).catchError((error) {});
  }
}
