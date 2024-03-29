import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/estrenos.dart';
import 'package:peliculas/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> pelis;
  const CardSwiper({
    Key? key,
    required this.pelis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (pelis.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
          itemCount: 20,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final movie = pelis[index];
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FadeInImage(
                  placeholder: NetworkImage(movie.fullPosterImg),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}

class CardSwiperr extends StatelessWidget {
  final List<Estrenos> peliculas;
  const CardSwiperr({
    Key? key,
    required this.peliculas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (peliculas.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.10,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
          itemCount: 20,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, int index) {
            final estre = peliculas[index];
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'detailss', arguments: estre),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: FadeInImage(
                  placeholder: NetworkImage(estre.fullPosterImg),
                  image: NetworkImage(estre.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
