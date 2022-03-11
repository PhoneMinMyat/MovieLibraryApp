import 'package:flutter/foundation.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movie_model_impl.dart';
import 'package:movie_app/data/vos/actor_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

class DetailsPageBloc extends ChangeNotifier{
  //State Variable
  MovieVO? mMovie;
  List<ActorVO>? mCastList;
  List<ActorVO>? mCrewList;

  //Movie Model
 final MovieModel _mMovieModel = MovieModelImpl();

 DetailsPageBloc(int movieId){
   //Movie Details
   _mMovieModel.getMovieDetailsFromDatabase(movieId).then((movie) {
     mMovie = movie;
     notifyListeners();
   }).catchError((error){});

   //Cast and Crew
   _mMovieModel.getCreditByMovie(movieId).then((castAndCrewList){
     mCastList = castAndCrewList[0];
     mCrewList = castAndCrewList[1];
     notifyListeners();
   }).catchError((error){});
 }
}