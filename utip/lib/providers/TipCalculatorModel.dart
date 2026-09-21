import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/widget/total_per_person.dart';

class TipCalculatorModel with ChangeNotifier {
  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;


  int get personCount => _personCount;
  double get tipPercentage => _tipPercentage;
  double get billTotal => _billTotal;

  void updatePersonCount(int personCount) {
    _personCount = personCount;
    notifyListeners();
  }

  void updateTipPercentage(double tipPercentage) {
    _tipPercentage = tipPercentage;
    notifyListeners();
  }


  void updateBillTotal(double billTotal) {
    _billTotal = billTotal;
    notifyListeners();
  }

  double get totalPerPerson => ((_billTotal * _tipPercentage) + (_billTotal)) /_personCount;

  double get totalTip =>((_billTotal * _tipPercentage));
  
}