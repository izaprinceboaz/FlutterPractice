import 'package:flutter/material.dart';
import 'dart:math';
import 'settings.dart';


class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int _diceNumber = 1;

  void roll() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1;
      // print("New $_diceNumber");
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Roll Dice'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Roll Dice'),
            Image.asset(
              'assets/dice-$_diceNumber.png',
              width: 150,
            ),
            ElevatedButton(
              onPressed: roll, 
              child: Text('Roll Dice')
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const SettingsScreen()));
              }, 
              child: Text('Go to Settings')
              )
          ],
        ),
      ),
    );
  }
}