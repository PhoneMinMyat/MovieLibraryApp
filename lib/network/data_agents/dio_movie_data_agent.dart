import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/network/data_agents/movie_data_agent.dart';

class DioMovieDataAgentImpl extends MovieDataAgent {
  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    Map<String, String> queryParams = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString()
    };

    return Dio()
        .get("$BASE_URL_DIO$ENDPOINTS_GET_NOW_PLAYING",
            queryParameters: queryParams)
        .asStream()
        .map((respone) => respone as List<MovieVO>)
        .first;
  }
}
