import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  TransactionCard({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            child: const Text('\$'),
          ),
          Column(
            children: [
              Text(title),
              Text(amount.toString()),
            ],
          )
        ],
      ),
    );
  }
}
