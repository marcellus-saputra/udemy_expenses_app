import 'package:flutter/material.dart';

import 'transaction.dart';
import 'txcard.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> txList;

  TransactionList(this.txList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: txList.map((tx) {
            return TransactionCard(
              id: tx.id,
              title: tx.title,
              amount: tx.amount,
              date: tx.date,
            );
          }).toList(),
        ),
      ),
    );
  }
}
