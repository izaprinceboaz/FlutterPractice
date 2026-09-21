import 'package:counter_page/providers/CounterModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => CounterModel(),
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {

    // final counter = Provider.of<CounterModel>(context);

    return Scaffold(
      body: Center(
        child: Consumer<CounterModel>(
          builder: (BuildContext context, CounterModel value, Widget? child) { 
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter Value: ${value.counter}'),
                ElevatedButton(
                  onPressed: () {
                    value.increment();
                  }, 
                  child: Icon(Icons.add)
                  )
              ],
            );
           },
        ),
      ),
    );
  }
}