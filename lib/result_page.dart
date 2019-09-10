import 'package:flutter/material.dart';
import 'input_screen.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.bmiresult,
      @required this.getweight,
      @required this.structure});
  final String bmiresult;
  final String getweight;
  final String structure;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Your Result",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(getweight,
                        style: TextStyle(
                            color: Color(0xff24d876),
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    Text(bmiresult,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold)),
                    Text(
                      structure,
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xff1A1E30),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                    child: Text(
                  "RE-CALCULATE YOUR BMI",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                width: double.infinity,
                height: containerBottomhight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffEA1556),
                ),
              ),
            ),
          ],
        ));
  }
}
