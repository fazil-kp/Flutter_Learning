import 'dart:math';

import 'package:counterapp/futuraClass/provider/movie_model.dart';
import 'package:flutter/material.dart';

final List<Movie> initialData = List.generate(
  50,
  (index) => Movie(
      title: "Movie ${index + 1}",
      duration: "${Random().nextInt(160)} minutes"),
);

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;

  List<Movie> get movies => _movies;

  final List<Movie> _myList = [];

  List<Movie> get myList => _myList;

  // important
  void addToList(Movie movie) {
    _myList.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    _myList.remove(movie);
    notifyListeners();
  }
}
