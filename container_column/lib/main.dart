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
        body: Column(
          children: buildWidgets(context),
        ),
      ),
    );
  }
}

List<Widget> buildWidgets(context){
  var colors = [Colors.redAccent, Colors.greenAccent, Colors.blueAccent];
  return colors.map((color) => Container(
    height: 50,
    width: 50,
    color: color,
  )).toList();  
}