import 'package:flutter/material.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/network/movie_data_agent.dart';
import 'package:dio/dio.dart';

class DioMovieDataAgentImpl extends MovieDataAgent {
  @override
  void getMovieData(int page) {
    Map<String, String> queryParams = {
      PARAM_API_KEY: API_KEY,
      PARAM_LANGUAGE: LANGUAGE_EN_US,
      PARAM_PAGE: page.toString()
    };

    Dio()
        .get("$BASE_URL_DIO$ENDPOINTS_GET_NOW_PLAYING",
            queryParameters: queryParams)
        .then((value) {
      debugPrint('GET NOW PLAYING ========> ${value.toString()}');
    }).catchError((error) {
      debugPrint(' ERROR =======> ${error.toString()}');
    });
  }
}
