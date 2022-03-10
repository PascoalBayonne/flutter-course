import 'package:flutter/material.dart';
import 'package:iGo/Transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "iGo",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1',
        title: 'Diesel 4 Mercedez',
        amount: 59.99,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'NoSolo Italia : Calzone',
        amount: 6.23,
        date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Jordan Air', amount: 200, date: DateTime.now())
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('iGo'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('CHART'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      autocorrect: true,
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                    ),
                    TextField(
                      autocorrect: true,
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountController,
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                          borderRadius: BorderRadius.circular(4)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '\€ ${tx.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                        Text(
                          DateFormat().format(tx.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ));
  }
}
