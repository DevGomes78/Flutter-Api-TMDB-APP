import 'package:flutter/material.dart';

class BuildButton extends StatefulWidget {
  const BuildButton({Key? key}) : super(key: key);

  @override
  State<BuildButton> createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Chip(
              label: Text(
                'Todos',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black38,
              padding: EdgeInsets.only(left: 12, right: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Chip(
              label: Text(
                'Ação',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black38,
              padding: EdgeInsets.only(left: 12, right: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Chip(
              label: Text(
                'Suspense',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black38,
              padding: EdgeInsets.only(left: 12, right: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Chip(
              label: Text(
                'Aventura',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black38,
              padding: EdgeInsets.only(left: 12, right: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Chip(
              label: Text(
                'Terror',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black38,
              padding: EdgeInsets.only(left: 12, right: 12),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Chip(
              label: Text(
                'Ficção',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black38,
              padding: EdgeInsets.only(left: 10, right: 10),
            ),
          ),
        ],
      ),
    );
  }
}
