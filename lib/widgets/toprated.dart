import 'package:aula3/pages/description.dart';
import 'package:aula3/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  late final List toprated;

  TopRated({required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Popular',
              style: AppText.textFont25,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Description(
                              name: toprated[index]['title'],
                              bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['backdrop_path'],
                              posteurl: 'https://image.tmdb.org/t/p/w500' +
                                  toprated[index]['poster_path'],
                              description: toprated[index]['overview'],
                              vote: toprated[index]['vote_average'].toString(),
                              launch_on: toprated[index]['release_date'],
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
                                        toprated[index]['poster_path'],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                toprated[index]['title'] != null
                                    ? toprated[index]['title']
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
