import 'package:flutter/material.dart';
import 'package:movie_app/network/dio_movie_data_agent.dart';
import 'package:movie_app/network/http_movie_data_agent_impl.dart';
import 'package:movie_app/pages/home_page.dart';


void main() {
  DioMovieDataAgentImpl().getMovieData(1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
