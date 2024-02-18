import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double porcentage;

  ChartBar({
    required this.label,
    required this.value,
    required this.porcentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(
          child: Text('${value.toStringAsFixed(2)}'),
        ),
        const SizedBox(height: 4),
        Container(
          height: 60,
          width: 16,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              FractionallySizedBox(
                heightFactor: porcentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          child: Text(label),
        ),
      ],
    );
  }
}
