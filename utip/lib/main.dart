import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/providers/ThemeProvider.dart';
import 'package:utip/providers/TipCalculatorModel.dart';
import 'package:utip/widget/bill_amount_field.dart';
import 'package:utip/widget/person_counter.dart';
import 'package:utip/widget/tip_row.dart';
import 'package:utip/widget/tip_slider.dart';
import 'package:utip/widget/toggle_theme_button.dart';
import 'package:utip/widget/total_per_person.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TipCalculatorModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()
        )
      ],
      child: const MyApp()
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return MaterialApp(
      title: 'Utip',
      theme: themeProvider.currentTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      //   useMaterial3: true,
      // ),
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

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    final style =theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,

    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utip'),
        actions: [
          const ToggleThemeButton()
        ],
      ),
      body: Consumer<TipCalculatorModel>(
        builder: (BuildContext context, TipCalculatorModel value, Widget? child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TotalPerPerson(theme: theme, style: style, total: value.totalPerPerson),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
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
                        billAmount: value.billTotal.toString(),
                        onChanged: (text) {
                          value.updateBillTotal(double.tryParse(text) ?? 0.0);
                        }
                      ),
                      PersonCounter(
                        theme: theme, 
                        personCount: value.personCount, 
                        onDecrement: (){
                          if (value.personCount > 1) {
                            value.updatePersonCount(value.personCount - 1 );
                          }
                        }, 
                        onIncrement: () {
                          value.updatePersonCount(value.personCount + 1);
                        }
                      ),
                      TipRow(theme: theme, totalT: value.totalTip),
                      Text(
                        '${(value.tipPercentage*100).round()}%'
                      ),
                      TipSlider(
                        tipPercentage: value.tipPercentage,
                        onChanged: (double tipP) => {
                          value.updateTipPercentage(tipP)
                        },
                        ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}