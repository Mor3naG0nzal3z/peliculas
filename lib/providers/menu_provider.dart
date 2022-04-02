import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/cast.dart';
import 'package:peliculas/models/creditos.dart';
import 'package:peliculas/models/estrenos.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/models/populares.dart';
import 'package:peliculas/models/proximos.dart';

class MovieProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '864ac8c0a352c6076ac57c281a379eb8';
  final String _languaje = 'es-ES';

  List<Movie> onDisplayMovie = [];
  List<Movie> mostPopularMovieList = [];
  List<Estrenos> mostPopularEstrenosList = [];

  Map<int, List<Cast>> movieCast = {};

  MovieProvider() {
    getOnDisplayMovies();
    getMostPopularMovies();
    getMostPopularEstrenos();
    //getActores();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovie = nowPlayingResponse.results;
    notifyListeners();
  }

  getMostPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    final response = await http.get(url);
    final popularResponse = Populares.fromJson(response.body);
    mostPopularMovieList = popularResponse.results;

    notifyListeners();
  }

  getMostPopularEstrenos() async {
    var url = Uri.https(_baseUrl, '3/movie/top_rated',
        {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    final response = await http.get(url);
    final estrenoResponse = Proximos.fromJson(response.body);
    mostPopularEstrenosList = estrenoResponse.results;

    notifyListeners();
  }

  Future<List<Cast>> getActores(int movieID) async {
    var url = Uri.https(_baseUrl, '3/movie/$movieID/credits',
        {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    final response = await http.get(url);
    final actores = Creditos.fromJson(response.body);
    movieCast[movieID] = actores.cast;
    return actores.cast;
  }

  Future<List<Cast>> getActores1(int estreID) async {
    var url = Uri.https(_baseUrl, '3/movie/$estreID/credits',
        {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    final response = await http.get(url);
    final actores = Creditos.fromJson(response.body);
    movieCast[estreID] = actores.cast;
    return actores.cast;
  }
}
