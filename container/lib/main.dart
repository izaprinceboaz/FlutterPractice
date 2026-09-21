import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          // color: Colors.amber,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            border: Border.all(width: 10, color: Colors.lightBlue),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: const Text(
            'Hello'
          ),
        ),
      ),
    );
  }
}