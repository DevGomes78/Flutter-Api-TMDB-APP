import 'package:aula3/pages/description.dart';
import 'package:aula3/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TV extends StatelessWidget {
  late final List tv;

  TV({required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Seriados',
              style: AppText.textFont25,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 220,
              child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 15 / 9,
                    viewportFraction: 0.99,
                    initialPage: 0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayInterval: Duration(seconds: 3),
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: tv.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    if (tv.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Description(
                                name: tv[index]['original_name'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['backdrop_path'],
                                posteurl: 'https://image.tmdb.org/t/p/w500' +
                                    tv[index]['poster_path'],
                                description: tv[index]['overview'],
                                vote: tv[index]['vote_average'].toString(),
                                launch_on: tv[index]['first_air_date'],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                width: 395,
                                child: Column(children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 3),
                                    // padding:  EdgeInsets.all(5),
                                    width: 400,
                                    height: 220,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path']
                                                  .toString(),
                                          //tv[index]['poster_path'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Positioned(
                              left: 10,
                              bottom: 10,
                              child: Text(
                                tv[index]['original_name'].toString(),
                                style: AppText.textFont16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
