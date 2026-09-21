import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortune_cookie/providers/CrackCookie.dart';
import 'package:provider/provider.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => CrackCookie(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FortuneCookie(),
    );
  }
}

class FortuneCookie extends StatefulWidget {
  const FortuneCookie({super.key});

  @override
  State<FortuneCookie> createState() => _FortuneCookieState();
}

class _FortuneCookieState extends State<FortuneCookie> {
  // final List<String> _fortunes = [
  //   'A pleasant surprise is waiting for you.',
  //   'Your hard work is about to pay off.',
  //   'Adventure is close at hand.',
  //   'Trust the process. Also trust your linter.',
  // ];

  // String _current = 'Tap the button to crack a cookie.';

  // void crackCookie() {
  //   setState(() {
  //     _current = _fortunes[Random().nextInt(_fortunes.length)];
  //   });
  //   // print(_current);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fortune Cookie"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Consumer<CrackCookie>(
            builder: (BuildContext context, CrackCookie value, Widget? child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value.current,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 24,),
                  ElevatedButton(
                    onPressed: value.crackCookie,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      backgroundColor: Colors.grey,
              
                    ),
                    child: Text(
                      "Crack a cookie",
                      style: TextStyle(color: Colors.black),
                      ) 
                    ),
                    
                ],
              );
            }
          ),
          ),
      ),
    );
  }
}