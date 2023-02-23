import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;

  InputField(this.addTransaction);

  void submitData() {
    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0.0) {
      return;
    }

    addTransaction(
      inputTitle,
      inputAmount,
    );
  }

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
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  width: 2,
                  color: Colors.purple,
                ),
              ),
              onPressed: submitData,
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
