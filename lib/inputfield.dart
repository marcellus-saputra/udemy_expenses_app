import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  InputField(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Expenditure'),
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Amount'),
            controller: amountController,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          )
        ],
      ),
    );
  }
}
