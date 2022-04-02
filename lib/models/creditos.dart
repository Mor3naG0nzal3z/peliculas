import 'dart:convert';

import 'cast.dart';

class Creditos {
  Creditos({
    required this.id,
    required this.cast,
  });

  int id;
  List<Cast> cast;

  factory Creditos.fromJson(String str) => Creditos.fromMap(json.decode(str));

  factory Creditos.fromMap(Map<String, dynamic> json) => Creditos(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
      );
}
