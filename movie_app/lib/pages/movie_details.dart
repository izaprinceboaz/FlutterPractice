import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${movie.title}'),
      ),
    );
  }
}