import 'package:aula3/widgets/app_text.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final String? name;
  final String? description;
  final String? bannerurl;
  final String? posteurl;
  final String? vote;
  final String? launch_on;

  const Description({
    Key? key,
    this.name,
    this.description,
    this.bannerurl,
    this.posteurl,
    this.vote,
    this.launch_on,
  }) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}
class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: buildDescription(context),
    );
  }

  Padding buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        widget.bannerurl!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Text('  ⭐  Average rating - ' + widget.vote!,
                        style: AppText.textFont18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                null != widget.name.toString()
                    ? widget.name.toString()
                    : 'Não Carregado',
                style: AppText.textFont18,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'release On  ' + widget.launch_on.toString(),
                style: AppText.textFont16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 250,
                  child: Image.network(
                    widget.posteurl.toString(),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      widget.description.toString(),
                      style: AppText.textFont16,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
