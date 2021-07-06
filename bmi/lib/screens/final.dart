import 'dart:math';
import 'package:bmi/colors/color.dart';
import 'package:bmi/materials/fancybutton.dart';
import 'package:bmi/materials/styleicon.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'calconvert.dart';
import 'info_page.dart';




final GlobalKey<AnimatedCircularChartState> _chartKey =
    new GlobalKey<AnimatedCircularChartState>();

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String textResult;
  final double bmiPercentage;

  ResultPage({this.bmiResult, this.textResult, this.bmiPercentage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StyleIcon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      width: 45,
                      height: 45,
                      icon: FontAwesome.angle_left,
                    ),
                    Text(
                      'BMI Results',
                      style: TextStyle(
                        color: darkTextColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    StyleIcon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Calconvert(),
                          ),
                        );
                      },
                      width: 45,
                      height: 45,
                      icon: FontAwesome.calculator,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: foregroundColor,
                  shape: BoxShape.circle,
                  boxShadow: outerShadow,
                ),
                child: AnimatedCircularChart(
                  key: _chartKey,
                  size: const Size(190, 190),
                  holeLabel: bmiResult,
                  labelStyle: TextStyle(
                    color: darkTextColor,
                    fontSize: 40.0,
                  ),
                  initialChartData: <CircularStackEntry>[
                    CircularStackEntry(
                      <CircularSegmentEntry>[
                        CircularSegmentEntry(
                          bmiPercentage,
                          Theme.of(context).accentColor,
                          rankKey: 'completed',
                        ),
                        CircularSegmentEntry(
                          bmiPercentage <= 100 ? 100 - bmiPercentage : 0,
                          Colors.black12,
                          rankKey: 'remaining',
                        ),
                      ],
                      rankKey: 'progress',
                    ),
                  ],
                  chartType: CircularChartType.Radial,
                  edgeStyle: SegmentEdgeStyle.round,
                  percentageValues: true,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have ',
                    style: TextStyle(
                      color: darkTextColor,
                    ),
                  ),
                  Text(
                    textResult,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' body weight!',
                    style: TextStyle(
                      color: darkTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              FancyButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => InfoPage(
                        bmi: bmiResult,
                        resultText: textResult,
                      ),
                    ),
                  );
                },
                width: 120,
                text: 'Details',
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}


class BMICalculator {
  BMICalculator({this.height, this.weight});

  int height;
  int weight;
  double bmi;

  String getBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi < 18.5)
      return 'Underweight';
    else if (bmi >= 18.5 && bmi <= 24.9)
      return 'Normal';
    else
      return 'Overweight';
  }

  double getBMIPercentage() {
    double percentage;
    //Above 25 person is overweight so after 29.9 bmi percentage chart will be full 100%
    percentage = bmi / 29.9 * 100;
    return percentage;
  }
}
