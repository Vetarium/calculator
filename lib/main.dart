import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  MyApp({Key key}): super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _history = "";
  String _expression = "";

  void numClick(String text){
    setState(() {
      _expression+=text;
    });
  }

  void ochistil(String text) {
    setState(() {
      _history = "";
      _expression = "";
    });
  }
  void udalil(String text) {
       setState(() {
         _expression = "";
       });
  }
  void ravno(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double ans = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = ans.toString();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shitalka',
      home: Scaffold(
        backgroundColor: Color(0xFF5D837B),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 13),
              child: Text(
                  _history,

                  style: TextStyle(
                      color: Color(0xFFFFFFFF),

                      fontSize: 24
                  )


              ),
              alignment: Alignment(1, 1),
            ),
            Container(
              padding: EdgeInsets.all(13),
              child: Text(
                  _expression,

                  style: TextStyle(
                      color: Color(0xFFFFFFFF),

                      fontSize: 48
                  )


              ),
              alignment: Alignment(1, 1),
            ),
            SizedBox(
              height: 30,
            ),


            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "AC",
                    fillColor: 0xFFA1C247,
                    callback: ochistil,

                  ),
                  CalcButton(
                    text: "C",
                    fillColor: 0xFFA1C247,
                    callback: udalil,

                  ),
                  CalcButton(
                    text: "%",
                    fillColor: 0xFF9CB418,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: "/",
                    fillColor: 0xFF9CB418,
                    callback: numClick,
                  ),

                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "7",
                    callback: numClick,


                  ),
                  CalcButton(
                    text: "8",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "9",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "*",
                    fillColor: 0xFF9CB418,
                    callback: numClick,
                  ),

                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "4",
                    callback: numClick,


                  ),
                  CalcButton(
                    text: "5",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "6",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "-",
                    textSize: 30,
                    fillColor: 0xFF9CB418,
                    callback: numClick,
                  ),

                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "1",
                    callback: numClick,


                  ),
                  CalcButton(
                    text: "2",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "3",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "+",
                    fillColor: 0xFF9CB418,
                    callback: numClick,
                  ),

                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: ".",
                    callback: numClick,


                  ),
                  CalcButton(
                    text: "0",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "00",
                    callback: numClick,

                  ),
                  CalcButton(
                    text: "=",
                    fillColor: 0xFFFF9505,
                    callback: ravno,
                    //
                  ),

                ]
            ),

          ],
        ),
      ),
    );
  }
}

