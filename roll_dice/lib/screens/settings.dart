import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            Text('This is where the settings go.'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            ),
          ]
        ),
      ),
    );
  }
}