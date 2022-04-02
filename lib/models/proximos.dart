import 'dart:convert';
import 'estrenos.dart';

class Proximos {
  Proximos({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Estrenos> results;
  int totalPages;
  int totalResults;

  factory Proximos.fromJson(String str) => Proximos.fromMap(json.decode(str));

  factory Proximos.fromMap(Map<String, dynamic> json) => Proximos(
        page: json["page"],
        results: List<Estrenos>.from(
            json["results"].map((x) => Estrenos.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
