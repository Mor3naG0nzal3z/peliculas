import 'dart:convert';

import 'movie.dart';

class Populares {
  Populares({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory Populares.fromJson(String str) => Populares.fromMap(json.decode(str));

  factory Populares.fromMap(Map<String, dynamic> json) => Populares(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
