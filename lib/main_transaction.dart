import 'package:flutter/material.dart';

import 'transactionlist.dart';
import 'inputfield.dart';
import 'transaction.dart';

class MainTransaction extends StatefulWidget {
  const MainTransaction({super.key});

  @override
  State<MainTransaction> createState() => _MainTransactionState();
}

class _MainTransactionState extends State<MainTransaction> {
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

  void addTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: InputField(addTransaction),
          ),
        ),
        Card(
          child: TransactionList(transactions),
        ),
      ],
    );
  }
}
