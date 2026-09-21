import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const new({
    super.key,
    required this.theme,
    required this.style,
    required this.total,
  });

  final ThemeData theme;
  final TextStyle style;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(              
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(8)
          ),
        child: Column(
          children: [
            Text(
              'Total Per Person',
              style: style,
              ),
            Text(
              total.toStringAsFixed(2),
              style: style.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: theme.textTheme.displaySmall!.fontSize,
              ),
              ),
          ],
        )
      ),
    );
  }
}