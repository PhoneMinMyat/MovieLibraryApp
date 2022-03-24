import 'package:flutter/material.dart';
import 'package:movie_app/data/vos/movie_vo.dart';
import 'package:movie_app/resources/dimens.dart';
import 'package:movie_app/viewitems/movie_view.dart';
import 'package:movie_app/widgets/smart_listview.dart';
import 'package:movie_app/widgets/title_text.dart';

class TitleAndMovieListView extends StatelessWidget {
  final Function(int?) movieOnTap; final Function onMovieListReachedEnd;
  final List<MovieVO>? movieList;
  final String title;
  const TitleAndMovieListView(
    this.movieOnTap, {
    required this.movieList,
    required this.title,required this.onMovieListReachedEnd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
            child: TitleText(text: title)),
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        HorizontalMovieListView(
          (movieId) => movieOnTap(movieId),
          movieList: movieList,
          onMovieListReachedEnd: (){
             onMovieListReachedEnd();
          },
        ),
      ],
    );
  }
}

class HorizontalMovieListView extends StatelessWidget {
  final Function(int?) movieOnTap;
  final Function onMovieListReachedEnd;
  final List<MovieVO>? movieList;
  const HorizontalMovieListView(
    this.movieOnTap, {
    required this.movieList,required this.onMovieListReachedEnd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (movieList != null)
        ? SizedBox(
            height: MOVIE_LIST_HEIGHT,
            child:
                //   ListView.builder(
                //       shrinkWrap: true,
                //       padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
                //       itemCount: movieList?.length ?? 0,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (BuildContext context, int index) {
                //         return GestureDetector(
                //           onTap: () => movieOnTap(movieList?[index].id),
                //           child: MovieView(
                //             movie: movieList?[index],
                //           ),
                //         );
                //       }),
                // )
                SmartListView(
                  itemCount: movieList?.length ?? 0,
                    builder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => movieOnTap(movieList?[index].id),
                        child: MovieView(
                          movie: movieList?[index],
                        ),
                      );
                    },
                    padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2x),
                    onListReachedEnd: (){
                      onMovieListReachedEnd();
                    }))
        : const Center(child: CircularProgressIndicator());
  }
}
