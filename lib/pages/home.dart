import 'package:aula3/widgets/bild_button.dart';
import 'package:aula3/widgets/toprated.dart';
import 'package:aula3/widgets/trending.dart';
import 'package:aula3/widgets/tv.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String ApiKey = '2e87559353735e676f6f55cd26a0a332';
  final token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZTg3NTU5MzUzNzM1ZTY3NmY2ZjU1Y2QyNmEwYTMzMiIsInN1YiI6IjYxZjk1ZmU0NmRjNTA3MDAxZDZlOWYxOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sqkAyZ7wOrI0lhNOMF9BSfdQa_y0CqofzfLHR2_CB5w';

  @override
  void initState() {
    CarregarFilmes();
    super.initState();
  }

  CarregarFilmes() async {
    TMDB tmdbWithCustonLogs = TMDB(ApiKeys(ApiKey, token),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCustonLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustonLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustonLogs.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingresult);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Filmes e Seriados 🎥'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TV(tv: tv),
              BuildButton(),
              TopRated(toprated: topratedmovies),
              TrendingMovies(
                trending: trendingmovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
