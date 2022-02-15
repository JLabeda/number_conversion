import 'package:flutter/material.dart';
import 'package:number_conversion/screens/convert_number_screen.dart';

void main() {
  runApp(NumberConversion());
}

class NumberConversion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const ConvertNumberScreen(),
    );
  }
}
