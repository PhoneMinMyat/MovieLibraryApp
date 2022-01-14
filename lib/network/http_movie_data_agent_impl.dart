import 'package:flutter/material.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:http/http.dart' as http;

class HttpMovieDataImpl extends MovieDataAgent {
  @override
  void getMovieData(int page) {
    Map<String, String> queryParams = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString()
    };

    var url = Uri.https(BASE_URL_HTTPS, ENDPOINTS_GET_NOW_PLAYING, queryParams);

    http.get(url).then((value) {
      debugPrint('GET NOW PLAYING ========> ${value.body.toString()}');
    }).catchError((error) {
      debugPrint(' ERROR =======> ${error.toString()}');
    });
  }
}
