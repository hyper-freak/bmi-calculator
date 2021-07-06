import 'package:bmi/colors/color.dart';
import 'package:bmi/materials/fancybutton.dart';
import 'package:bmi/materials/styleicon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';


class Calconvert extends StatefulWidget {
  @override
  _CalconvertState createState() => _CalconvertState();
}

class _CalconvertState extends State<Calconvert> {
  @override
  // ignore: override_on_non_overriding_member
  double _userInput;
  String _convertedMeasure;
  String errorMessage;
  String _startValue;
  var fromUnits = [
    'Meters (m)',
    'Kilometer (km)',
    'Grams (gm)',
    'Kilograms (kg)',
    'Feet (ft)',
    'Miles (mi)',
    'Pounds (lbs)',
    'ounces (oz)'
  ];

  final Map<String,int> measuresMap ={
    'Meters (m)':0,
    'Kilometer (km)':1,
    'Grams (gm)':2,
    'Kilograms (kg)':3,
    'Feet (ft)':4,
    'Miles (mi)':5,
    'Pounds (lbs)':6,
    'ounces (oz)':7
  };

  dynamic formulas ={

    '0':[1,0.001,0,0,3.280,0.0006213,0],
    '1':[1000,1,0,0,3280.84,0,6213,0,0],
    '2':[0,0,1,0.0001,0,0,0.00220,0.03],
    '3':[0,0,1000,1,0,0,2.2046,35.274],
    '4':[0.0348,0.00030,0,0,1,0.000189],
    '5':[1609.34,1.60934,0,05280,1,0,0],
    '6':[0,0,453.592,0.4535,0,0,1,16],
    '7':[0,0,28.3495,0.02834,3.28084,0,0.1]
  };

   final myController = TextEditingController();
  void converter (double value,String from,String to)
  {

    int nFrom=measuresMap[from];
    int nTo=measuresMap[to];
    var multiplier=formulas[nFrom.toString()][nTo];
    var result=value * multiplier;

    if(result==0)
      {
        errorMessage='Please Enter Correct Input';
      }
    else
      {
        errorMessage='${_userInput.toString()} $_startValue is equal to ${result.toString()} $_convertedMeasure';
      }
    setState(() {
      errorMessage=errorMessage;
    });

  }


  void initState() {
    _userInput = 0;
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              SizedBox(height:20,),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      
                      '             Unit Convertor',
                      style: TextStyle(
                        color: darkTextColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      
                    ),
                   
                  ],
                ),
              ),
                SizedBox(height: 30.0),
               
                      
                      Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                  child: TextField(
                    controller: myController,
                   maxLength: 25,
                   maxLengthEnforced: true,
                    style: TextStyle(fontSize: 15,color: Colors.black),
                    
                    
                    decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFCFAFF),
                    hintText: 'Enter Your Value',
                    
                    hintStyle: TextStyle(color: Colors.grey),
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                     
                       
                    ),

                  ),
                  onChanged: (text){

                    var input=double.tryParse(text);
                    if(input!=null)
                      {
                        setState(() {
                          _userInput=input;
                        });
                      }
                  },

                  ),
                ),
                      SizedBox(height: 40,),
                      
                  Row(
                children: <Widget>[
                  Expanded(
                    child:Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadiusDirectional.circular(10),
                      boxShadow: outerShadow,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(

                        hint: Text('Select Unit',style: TextStyle(color: Colors.grey),),

                         dropdownColor: Colors.grey[100],
                        isExpanded: true,style: TextStyle(
                        fontSize: 16,color: Color(0xFF5B6275)
                      ),   items: fromUnits.map((String value) {
                        return DropdownMenuItem<String>(

                            value: value,
                            child: Text(value),);
                      } ).toList(),
                      onChanged: (String value){
                          setState(() {

                            _startValue=value;

                          });
                      },
                        value: _startValue,
                      ),
                    ),
                  ),
                    ),
                
                     SizedBox(width: 20.0),
                    Expanded(
                     child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadiusDirectional.circular(10),
                       boxShadow: outerShadow,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(

                       hint: Text('Select Unit',style: TextStyle(color: Colors.grey),),

                         dropdownColor: Colors.grey[100],
                        isExpanded: true,style: TextStyle(
                        fontSize: 16,color: Color(0xFF5B6275)
                      ),   items: fromUnits.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),);
                      } ).toList(),
                        onChanged: (String value){
                          setState(() {

                            _convertedMeasure=value;

                          });
                        },
                        value: _convertedMeasure,
                      ),
                    ),
                  ),
                              
                            ),
                 
                ],
              ),

               SizedBox(height:30),
                     
                  Container(
                  height: 50,
                  decoration: BoxDecoration(
                  color: foregroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: outerShadow,
                ), child: SingleChildScrollView(
                     child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Text((errorMessage==null)?'':errorMessage,style: TextStyle(fontSize: 15, color: lightTextColor,
                                     
                                    ),),
                             
                            ],
                         ),
                      ),
                    ),
                     
                     ),




                SizedBox(height:20),
               FancyButton(
                onPressed: () {
                  if(_startValue.isEmpty || _convertedMeasure.isEmpty || _userInput==0)
                        return;
                      else {
                        converter(_userInput, _startValue, _convertedMeasure);
                      }
                    
                },
                width: 120,
                text: 'Calculate',

              ),


                   
                    
                
                SizedBox(height: 10,),
                

                          ],
                  ),
          ),
        ),
    );
  }}