import 'package:flutter/material.dart';

import 'main_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
        ),
        body: MainTransaction(),
      ),
    );
  }
}
