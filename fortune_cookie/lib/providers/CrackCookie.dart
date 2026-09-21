import 'dart:math';

import 'package:flutter/material.dart';

class CrackCookie with ChangeNotifier {
  final List<String> _fortunes = [
    'A pleasant surprise is waiting for you.',
    'Your hard work is about to pay off.',
    'Adventure is close at hand.',
    'Trust the process. Also trust your linter.',
  ];

  String _current = 'Tap the button to crack a cookie.';

  String get current => _current;
  
  void crackCookie() {
      _current = _fortunes[Random().nextInt(_fortunes.length)];
      notifyListeners();
  }
}