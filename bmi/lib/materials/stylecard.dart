import 'package:bmi/colors/color.dart';
import 'package:flutter/material.dart';

class StyleCard extends StatelessWidget {
  final lowerBMI;
  final upperBMI;
  final bmiResult;

  StyleCard({this.lowerBMI, this.upperBMI, this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              lowerBMI.toString(),
              style: TextStyle(
                color: darkTextColor,
                fontSize: 12.0,
              ),
            ),
            upperBMI != null
                ? Text(
                    ' to ' + upperBMI.toString(),
                    style: TextStyle(
                      color: darkTextColor,
                      fontSize: 12.0,
                    ),
                  )
                : Text(''),
          ],
        ),
        Text(
          bmiResult.toString(),
          style: TextStyle(
            color: darkTextColor,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
