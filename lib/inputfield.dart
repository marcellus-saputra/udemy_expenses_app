import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputField extends StatefulWidget {
  final Function addTransaction;

  InputField(this.addTransaction);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void submitData() {
    if (amountController.text.isEmpty) return;

    final inputTitle = titleController.text;
    final inputAmount = double.parse(amountController.text);
    titleController.clear();
    amountController.clear();

    if (inputTitle.isEmpty || inputAmount <= 0.0 || selectedDate == null) {
      return;
    }

    widget.addTransaction(
      inputTitle,
      inputAmount,
      selectedDate,
    );

    Navigator.of(context).pop();
  }

  void presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Expenditure',
              ),
              controller: titleController,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              children: [
                Text(
                  (selectedDate == null
                      ? 'No date chosen'
                      : DateFormat.yMMMd().format(selectedDate!)),
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 14,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(
                        width: 2,
                        color: Colors.transparent,
                      )),
                  onPressed: presentDatePicker,
                  child: const Text(
                    'Choose date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
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
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
