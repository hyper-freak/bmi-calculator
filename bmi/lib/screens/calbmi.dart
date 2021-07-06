import 'dart:math';
import 'package:bmi/colors/color.dart';
import 'package:bmi/materials/card.dart';
import 'package:bmi/materials/stylebutton.dart';
import 'package:bmi/materials/styleicon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'calconvert.dart';
import 'final.dart';

enum Gender {
  male,
  female,
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender selectedGender;
  double height = 100;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          color: backgroundColor,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                   
                    Text(
                      'Body Mass Index',
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
              Row(
                children: <Widget>[
                  Expanded(
                    child: StyleButton(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      text: 'Male',
                      textColor: selectedGender == Gender.male
                          ? Colors.white
                          : lightTextColor,
                      gradient: selectedGender == Gender.male
                          ? LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xFF33dada),
                                Color(0xFF5EF2F2),
                              ],
                            )
                          : LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xFFF0EEF3),
                                Color(0xFFF0EEF3),
                              ],
                            ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: StyleButton(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      text: 'Female',
                      textColor: selectedGender == Gender.female
                          ? Colors.white
                          : lightTextColor,
                      gradient: selectedGender == Gender.female
                          ? LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xFF33dada),
                                Color(0xFF5EF2F2),
                              ],
                            )
                          : LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xFFF0EEF3),
                                Color(0xFFF0EEF3),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   
                    SizedBox(height: 20.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: CardNew(
                                onPressedAdd: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                onPressedRemove: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                text: 'Weight',
                                number: weight.toString(),
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: CardNew(
                                onPressedAdd: () {
                                  setState(() {
                                    age++;
                                    print(age);
                                  });
                                },
                                onPressedRemove: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                text: 'Age',
                                number: age.toString(),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    )
                    
                  ],
                ),
              ),
              SizedBox(height: 30.0),    
                Expanded(child: Container(
                          height: 50.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'lib/images/bmi.png'),
                              fit: BoxFit.fill,
                              ),
                              shape: BoxShape.rectangle,
                          ),
                        ),),
                  SizedBox(height: 50.0),
               Expanded(
                      child: Container(
                        
                   
                       width: double.infinity,
                      decoration: BoxDecoration(
                          color: foregroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: outerShadow,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Height (cm)',
                              style: TextStyle(
                                color: lightTextColor,
                              ),
                            ),
                            Transform.rotate(
                              angle: 12 * pi / 2,
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbColor: Colors.white70,
                                  activeTrackColor:
                                      Theme.of(context).accentColor,
                                  inactiveTrackColor: Colors.black12,
                                ),
                                child: Slider(
                                  min: 54,
                                  max: 280,
                                  value: height,
                                  onChanged: (value) {
                                    setState(() {
                                      height = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  height.toInt().toString(),
                                  style: TextStyle(
                                    color: darkTextColor,
                                    fontSize: 30.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, bottom: 3.0),
                                  child: Text(
                                    'cm',
                                    style: TextStyle(
                                      color: lightTextColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

              SizedBox(height: 30.0),
              StyleButton(
                width: double.infinity,
                onPressed: () {
                  BMICalculator calc =
                      BMICalculator(height: height.toInt(), weight: weight);
                  setState(() {
                    if (selectedGender != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            bmiResult: calc.getBMI(),
                            textResult: calc.getResult(),
                            bmiPercentage: calc.getBMIPercentage(),
                          ),
                        ),
                      );
                    }
                  });
                },
                
                text: 'Calculate BMI',
                
                textColor: Colors.blueGrey,
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                 
                  colors: [
                    Color(0xFF33dada),
                    Color(0xFF5EF2F2),
                    
                  ],
                ),
              ),
              SizedBox(height: 30.0)
            ],
          ),
        ),
      ),
    );
  }
}
