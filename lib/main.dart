import 'package:flutter/material.dart';

import 'transaction.dart';
import 'txcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    final List<Transaction> transactions = [
      Transaction(
        id: 't1',
        title: 'Shoes',
        amount: 59.99,
        date: DateTime.now(),
      ),
      Transaction(
        id: 't2',
        title: 'Groceries',
        amount: 21.12,
        date: DateTime.now(),
      ),
    ];

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                color: Colors.blue,
                child: const Text('Chart'),
              ),
            ),
            Card(
              child: Column(
                children: transactions.map((tx) {
                  return TransactionCard(
                      id: tx.id,
                      title: tx.title,
                      amount: tx.amount,
                      date: tx.date);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
