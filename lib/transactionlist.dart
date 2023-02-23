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
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return TransactionCard(
            id: txList[index].id,
            title: txList[index].title,
            amount: txList[index].amount,
            date: txList[index].date,
          );
        },
        itemCount: txList.length,
      ),
    );
  }
}
