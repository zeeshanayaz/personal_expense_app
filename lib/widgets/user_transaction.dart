import 'package:flutter/material.dart';
import 'package:personal_expense_app/models/transaction.dart';

import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 60.00,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    void _addNewTransaction(String txTitle, double txAmount) {
      final newTx = Transaction(
          title: txTitle,
          amount: txAmount,
          date: DateTime.now(),
          id: DateTime.now().toString());
      setState(() {
        print("Adding Transaction $txTitle $txAmount");
        _userTransactions.add(newTx);
      });
    }

    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
