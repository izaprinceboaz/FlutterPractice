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
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Mona Lisa',
              style: TextStyle(color: Colors.black),
              ),
            ),
            backgroundColor: Colors.amber,
        ),
        body: const SafeArea(
          child: Image(
            image: AssetImage('images/mona_lisa.jpg'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            )
          ),
      ),
    );
  }
}