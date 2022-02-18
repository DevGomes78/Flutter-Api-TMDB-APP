import 'package:aula3/pages/description.dart';
import 'package:aula3/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  late final List trending;

  TrendingMovies({required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lançamentos',
              style: AppText.textFont25,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              name: trending[index]['title'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['backdrop_path'],
                              posteurl: 'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['poster_path'],
                              description: trending[index]['overview'],
                              vote: trending[index]['vote_average'].toString(),
                              launch_on: trending[index]['release_date'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path'],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
