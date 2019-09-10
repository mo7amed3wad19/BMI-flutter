import 'package:flutter/material.dart';
import 'input_screen.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0Xff090c22),
          scaffoldBackgroundColor: Color(0Xff090c22),
         
              ),
      home: InputPage(),
    );
  }
}

