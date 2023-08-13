
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'calc_button/calc_button.dart';
import 'navbar/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {

   const CalculatorScreen({super.key});

  @override
    State<CalculatorScreen> createState() => _CalculatorScreenState();
}


class  _CalculatorScreenState extends State<CalculatorScreen>{
  String calcValue = "0";

  void setCalcValue (s)=> setState(() =>{if(calcValue == "0") calcValue = s else calcValue +=s } );
  void deleteAll (s)=> setState(() => calcValue = "0");
  void deleteSingle (s)=> setState(() => calcValue =  calcValue.substring(0, calcValue.length - 1));
  void evaluateExpression(s) {
    try {
      String modifiedExpression = calcValue.replaceAll('x', '*'); // change 'x' to '*'
      Parser parser = Parser();
      Expression exp = parser.parse(modifiedExpression);
      ContextModel contextModel = ContextModel();
      double evalResult = exp.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        calcValue = evalResult.toString();
      });
    } catch (e) {
      setState(() {
        calcValue = 'Error';
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    final List<List<Map>> buttonLabels2 = [
      [{'value':'AC','method':deleteAll}, {'value':'<-', 'method':deleteSingle}, {'value':'%'},],
      [{'value':'7'}, {'value':'8',}, {'value':'9'}, {'value':'/'},],
      [{'value':'4'}, {'value':'5',}, {'value':'6'}, {'value':'x'},],
      [{'value':'1'}, {'value':'2',}, {'value':'3'}, {'value':'-'},],
      [{'value':'0'}, {'value':'.',}, {'value':'=', 'method':evaluateExpression}, {'value':'+'},],
    ];
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xff121313),
            ),
            child: Navbar(),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(20),
              child: Text(
                calcValue,
                style: TextStyle(fontSize: 48, color: Colors.white),
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              child: Column(
                children: buttonLabels2.map((row) {
                  return Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: row.map((label) {
                        return Expanded(
                          child: CalculatorButton(label: label['value'], onTap: label['method']??setCalcValue,),
                        );
                      }).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }


}



