import 'package:flutter/material.dart';
import 'package:movie_app/network/api_constants.dart';
import 'package:movie_app/resources/string.dart';

class ImageNetworkWithPlaceHolder extends StatelessWidget {
  final String imageUrl;
  final bool isMovie;
  const ImageNetworkWithPlaceHolder(
      {required this.imageUrl, this.isMovie = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imageUrl == IMAGE_BASE_URL)
        ? Image.asset((isMovie)
            ? MOVIE_IMAGE_PLACEHOLDER_PATH
            : PEOPLE_IMAGE_PLACEHOLDER_PATH)
        : FadeInImage.assetNetwork(
            placeholder: (isMovie)
                ? MOVIE_IMAGE_PLACEHOLDER_PATH
                : PEOPLE_IMAGE_PLACEHOLDER_PATH,
            image: imageUrl,
            fit: BoxFit.cover,
          );
  }
}
