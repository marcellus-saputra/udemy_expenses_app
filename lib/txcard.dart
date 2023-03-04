import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteHandler;

  TransactionCard({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.deleteHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$$amount'),
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(DateFormat.yMMMd().format(date)),
        trailing: IconButton(
            onPressed: () => deleteHandler(id),
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).colorScheme.error,
            )),
      ),
    );
  }
}
