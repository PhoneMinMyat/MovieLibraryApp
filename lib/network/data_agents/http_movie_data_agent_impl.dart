
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/network/api_constants.dart';

import 'package:http/http.dart' as http;
import 'package:movie_app/network/data_agents/movie_data_agent.dart';

class HttpMovieDataImpl extends MovieDataAgent {
  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) {
    Map<String, String> queryParams = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString()
    };

    var url = Uri.https(BASE_URL_HTTPS, ENDPOINTS_GET_NOW_PLAYING, queryParams);

    return http.get(url).asStream()
        .map((respone) => respone as List<MovieVO>).first;
  }
}
