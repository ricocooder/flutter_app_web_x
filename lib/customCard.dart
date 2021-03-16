import 'dart:math';

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({@required this.firstText, @required this.secondText});
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final fontsize = min(mediaQuery.size.height * 0.015, mediaQuery.size.width * 0.015);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: Colors.grey[800],
      margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 3.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
        child: Text(
          '$firstText: $secondText',
//          maxLines: 1,
          style: TextStyle(color: Colors.white,
              fontSize: fontsize
          ),
        ),
      ),
    );
  }
}
