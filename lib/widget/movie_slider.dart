import 'package:flutter/material.dart';
import 'package:peliculas/models/estrenos.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> popularMoviesList;
  const MovieSlider({
    Key? key,
    required this.popularMoviesList,
    required List<Movie> populares,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (popularMoviesList.isEmpty) {
      return SizedBox(
          width: double.infinity,
          height: size.height * 0.15,
          child: const Center(
            child: CircularProgressIndicator(),
          ));
    }

    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'POPULARES',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, int index) {
                final movie = popularMoviesList[index];
                return _MoviePoster(
                  poster: movie.fullPosterImg,
                  movieTitle: movie.title,
                  instance: movie,
                );
              },
              itemCount: 20,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class MovieSliderr extends StatelessWidget {
  final List<Estrenos> popularEstrenosList;
  const MovieSliderr({
    Key? key,
    required this.popularEstrenosList,
    required List<Estrenos> popular,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (popularEstrenosList.isEmpty) {
      return SizedBox(
          width: double.infinity,
          height: size.height * 0.15,
          child: const Center(
            child: CircularProgressIndicator(),
          ));
    }
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'SUGERENCIAS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, int index) {
                final movies = popularEstrenosList[index];
                return _MoviePosterr(
                  poster1: movies.fullPosterImg,
                  movieTitle1: movies.originalTitle,
                  instance1: movies,
                );
              },
              itemCount: 15,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePosterr extends StatelessWidget {
  final String poster1;
  final String movieTitle1;
  final Estrenos instance1;

  const _MoviePosterr({
    Key? key,
    required this.poster1,
    required this.movieTitle1,
    required this.instance1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detailss', arguments: instance1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/st.jpg'),
                image: NetworkImage(poster1),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movieTitle1,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final String poster;
  final String movieTitle;
  final Movie instance;

  const _MoviePoster({
    Key? key,
    required this.poster,
    required this.movieTitle,
    required this.instance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: instance),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/st.jpg'),
                image: NetworkImage(poster),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movieTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
