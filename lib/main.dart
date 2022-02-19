import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './helpers/num_translation.dart';
import './screens/convert_number_screen.dart';

void main() {
  runApp(NumberConversion());
}

class NumberConversion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => NumTranslation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const ConvertNumberScreen(),
      ),
    );
  }
}
