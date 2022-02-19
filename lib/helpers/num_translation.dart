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
    String _text;
    if (number < 1000) {
      _text = _hundreds(number);
    } else if (number >= 1000 && number < 1000000) {
      int _reducedNum = number ~/ 1000;
      int _remainder = number % 1000;
      if (number % 1000 == 0) {
        _text = '${_hundreds(_reducedNum)} thousand';
      } else {
        _text = '${_hundreds(_reducedNum)} thousand ${_hundreds(_remainder)}';
      }
    } else {
      _text = 'Please enter a number smaller than 1 million';
    }
    notifyListeners();
    return _text;
  }
}
