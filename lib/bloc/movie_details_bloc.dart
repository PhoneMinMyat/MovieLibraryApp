import 'dart:async';

import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class MovieDetailsBloc {
  ///Reactive Stream
  StreamController<MovieVO> movieDetailsStreamController = StreamController();
  StreamController<List<ActorVO>> castStreamController = StreamController();
  StreamController<List<ActorVO>> crewStreamController = StreamController();

  /// Movie Model
  MovieModel _mMovieModel = MovieModelImpl();

  MovieDetailsBloc(int movieId) {
    //Movie Details
    _mMovieModel.getMovieDetailsFromDatabase(movieId).then((movie) {
      if (movie != null) {
        movieDetailsStreamController.sink.add(movie);
      }
    }).catchError((error) {});

    //Cast and Crew
    _mMovieModel.getCreditByMovie(movieId).then((crewList) {
      if (crewList != null) {
        castStreamController.sink.add(crewList[0] ?? []);
        crewStreamController.sink.add(crewList[1] ?? []);
      }
    }).catchError((error) {});
  }

  void dispose() {
    movieDetailsStreamController.close();
    castStreamController.close();
    crewStreamController.close();
  }
}
