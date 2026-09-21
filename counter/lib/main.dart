import 'package:flutter/material.dart';

void main() {
  runApp(const CounterWidget());
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter $counter'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                }, 
                child: const Text('Increment')
                )
            ],
          ),
        ),
      ),
    );
  }
}