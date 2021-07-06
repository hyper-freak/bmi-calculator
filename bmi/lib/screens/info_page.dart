import 'dart:io';
import 'dart:typed_data';
import 'package:bmi/colors/color.dart';
import 'package:bmi/materials/stylebutton.dart';
import 'package:bmi/materials/stylecard.dart';
import 'package:bmi/materials/styleicon.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'calconvert.dart';

class InfoPage extends StatefulWidget {
 InfoPage({Key key, this.bmi, this.resultText, this.title}) : super(key: key);
  final String bmi;
  final String resultText;
final String title;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  File _imageFile;

  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
    super.initState();
   
  }
  
 @override
  Widget build(BuildContext context) {
    
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
 
              
       body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: Color(0xFFFAFAFA),

          child: new Center(  
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:30),
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
                      'BMI Info',
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
                Column(
                  children: <Widget>[
                    SizedBox(height: 0.0)   ,   
                  Container(
                  height: 110,
                  decoration: BoxDecoration(
                  color: foregroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: outerShadow,
                ),
                     child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                              Text(
                               'Your BMI',
                                   style: TextStyle(
                                   color: darkTextColor,
                                        ),
                                  ),
                              Text(
                                 widget.bmi,
                                 style: TextStyle(
                                 color: darkTextColor,
                                  fontSize: 48.0,
                                     ),
                                  ),
                              Text(
                                 widget.resultText,
                                 style: TextStyle(
                                 color: Theme.of(context).accentColor,
                                fontWeight: FontWeight.bold,
                                        ),
                                ),
                            ],
                         ),
                      ),
                    ),
                   SizedBox(height: 30.0),

                    Container(
                       height: 250,
                       decoration: BoxDecoration(
                       color: foregroundColor,
                       borderRadius: BorderRadius.all(Radius.circular(20.0)),
                       boxShadow: outerShadow,
                         ),
                
                         child: Padding(
                            padding: const EdgeInsets.symmetric(
                             horizontal: 20.0, vertical: 20.0),
                      
                             child: Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                      
                                    StyleCard(
                                         lowerBMI: 'Below 18.5',
                                         bmiResult: 'Underweight',
                                         ),
                                    Divider(height: 40.0),
                                    StyleCard(
                                        lowerBMI: '18.5',
                                        upperBMI: '24.9',
                                       bmiResult: 'Normal',
                                          ),
                                     Divider(height: 40.0),
                                      StyleCard(
                                          lowerBMI: '25',
                                          upperBMI: '29.9',
                                          bmiResult: 'Overweight',
                                          ),
                                   Divider(height: 40.0),
                                      StyleCard(
                                     lowerBMI: '30.0 and Above',
                                      bmiResult: 'Obese',
                                   ),
                          ],
                  ),
                ),
              ),

                      SizedBox(height: 30.0),
            
                    
                      StyleButton(
               onPressed: () async {
                      _takeScreenshotandShare();
                         },
                width: 200,
                text: 'Share With Friends',
                textColor: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xFF56D0DB),
                    Color(0xFF59C8E3),
                  ],
                ),
              ),
                  ],
                ),
              ],
            ),
          ),
        ),
       )
       
      ),
    );
  }
_takeScreenshotandShare() async {
    _imageFile = null;
    screenshotController
        .capture(delay: Duration(milliseconds: 10), pixelRatio: 2.0)
        .then((File image) async {
      setState(() {
        _imageFile = image;
      });
      final directory = (await getApplicationDocumentsDirectory()).path;
      Uint8List pngBytes = _imageFile.readAsBytesSync();
      File imgFile = new File('$directory/BMI_DETAILS.png');
      imgFile.writeAsBytes(pngBytes);
      await Share.file('BMI', 'BMI_DETAILS.png', pngBytes, 'images/png');
    }).catchError((onError) {
      print(onError);
    });
  }
      
}









