import 'package:flutter/material.dart';

import 'transaction.dart';
import 'txcard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> txList;

  TransactionList(this.txList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: txList.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
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
