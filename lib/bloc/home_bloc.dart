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

  //Variables
  int nowPlayinMoviePage = 1;

  HomeBloc() {
    //Now Playing
    _mMovieModel.getNowPlayingMoviesFromDatabase().listen((movieList) {
      mNowPlayingMovieList = movieList;
      notifyListeners();
    }).onError((error) {});

    //Popular Movies
    _mMovieModel.getPopularMoviesFromDatabase().listen((movieList) {
      mPopularMovieList = movieList;
      notifyListeners();
    }).onError((error) {});

    //TopRated Movies
    _mMovieModel.getTopRatedMoviesFromDatabase().listen((movieList) {
      mTopRatedMovieList = movieList;
      notifyListeners();
    }).onError((error) {});

    //Genres
    _mMovieModel.getGenresFromDatabase().listen((genreList) {
      mGenresList = genreList;
      //Movies By Genres
      _mMovieModel.getMoviesByGenre(genreList.first.id ?? 0).then((movieList) {
        mMoviesByGenreList = movieList;
        notifyListeners();
      }).catchError((error) {});
      notifyListeners();
    }).onError((error) {});

    //Actors
    _mMovieModel.getActorsFromDatabase().listen((actorList) {
      mActorsList = actorList;
      notifyListeners();
    }).onError((error) {});
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

  void onNowPlayingMovieListReachedEnd(){
    nowPlayinMoviePage += 1;
    _mMovieModel.getNowPlayingMovies(nowPlayinMoviePage);
  }
}
