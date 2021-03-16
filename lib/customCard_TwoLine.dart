import 'package:flutter/material.dart';

class CustomCardTwoLine extends StatelessWidget {
  const CustomCardTwoLine(
      {Key key,
        this.color,
        @required this.firstText,
        @required this.secondText})
      : super(key: key);
  final String firstText;
  final secondText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      color: color,
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        child: Text(
          '$firstText $secondText',
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
      ),
    );
  }
}