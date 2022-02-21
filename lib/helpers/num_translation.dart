import 'package:flutter/material.dart';

class NumTranslation with ChangeNotifier {
  String getOnes(int i) {
    const List<String> ones = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
    ];
    return ones[i];
  }

  String getTeens(int i) {
    const List<String> teens = [
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen',
    ];
    return teens[i];
  }

  String getTens(int i) {
    const List<String> tens = [
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety',
    ];
    return tens[i];
  }

  List<String> strings = [
    'thousand',
    'million',
    'billion',
    'trillion',
    'quadrillion',
    'quintillion',
  ];

  String _zeroToHundred(int number) {
    String _text;
    if (number < 10) {
      _text = getOnes(number);
    } else if (number < 20 && number >= 10) {
      _text = getTeens(number % 10);
    } else if (number >= 20 && number < 100) {
      _text = number % 10 == 0
          ? getTens((number ~/ 10) - 2)
          : getTens((number ~/ 10) - 2) + ' ' + getOnes(number % 10);
    } else {
      _text = 'error';
    }
    return _text;
  }

  String _hundreds(int number) {
    String _text;
    if (number < 100) {
      _text = _zeroToHundred(number);
    } else if (number >= 100 && number < 1000) {
      if (number % 100 == 0) {
        _text = '${getOnes(number ~/ 100)} hundred';
      } else {
        _text =
            '${getOnes(number ~/ 100)} hundred and ${_zeroToHundred(number % 100)}';
      }
    } else {
      _text = 'error';
    }
    return _text;
  }

  String translate(int number) {
    int _iterations = (number.toString().length / 3).ceil();
    String _text = '';
    int _remainder = number % 1000;
    for (int i = 1; i < _iterations; i++) {
      number = number ~/ 1000;
      int _rest = number % 1000;
      _text = '${_hundreds(_rest)} ${strings[i - 1]} ' + _text;
    }
    _text = _text + _hundreds(_remainder);
    notifyListeners();
    return _text;
  }
}
