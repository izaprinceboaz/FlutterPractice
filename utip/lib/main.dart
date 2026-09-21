import 'package:flutter/material.dart';
import 'package:utip/widget/bill_amount_field.dart';
import 'package:utip/widget/person_counter.dart';
import 'package:utip/widget/tip_row.dart';
import 'package:utip/widget/tip_slider.dart';
import 'package:utip/widget/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const Utip(),
    );
  }
}

class Utip extends StatefulWidget {
  const Utip({super.key});

  @override
  State<Utip> createState() => _UtipState();
}

class _UtipState extends State<Utip> {

  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;

  double totalPerPerson() {
    return ((_billTotal * _tipPercentage) + (_billTotal)) /_personCount;
  }

  double totalTip() {
    return ((_billTotal * _tipPercentage));
  }
  

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) {
        _personCount--;        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = totalPerPerson();
    double totalT = totalTip();

    final style =theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,

    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(theme: theme, style: style, total: total),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2
                )
              ),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(),
                    onChanged: (value) => {
                      setState(() {
                        _billTotal = double.parse(value);
                      })
                    },
                  ),
                  PersonCounter(
                    theme: theme, 
                    personCount: _personCount, 
                    onDecrement: decrement, 
                    onIncrement: increment
                  ),
                  TipRow(theme: theme, totalT: totalT),
                  Text(
                    '${(_tipPercentage*100).round()}%'
                  ),
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) => {
                      setState(() {
                        _tipPercentage = value;
                      })
                    },
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

