import 'package:flutter/material.dart';
import 'package:peliculas/providers/menu_provider.dart';
import 'package:peliculas/widget/card_swiper.dart';
import 'package:peliculas/widget/movie_slider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Tarjetas principales
            CardSwiper(
              pelis: movieProvider.onDisplayMovie,
            ),
            CardSwiperr(
              peliculas: movieProvider.mostPopularEstrenosList,
            ),
            //Slider de películas
            MovieSlider(
                populares: [],
                popularMoviesList: movieProvider.mostPopularMovieList),

            MovieSliderr(
                popular: [],
                popularEstrenosList: movieProvider.mostPopularEstrenosList),
          ],
        ),
      ),
    );
  }
}
