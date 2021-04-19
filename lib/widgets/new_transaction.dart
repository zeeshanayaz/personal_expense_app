import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleInputController = TextEditingController();
  final amountInputController = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  void submitData() {
   final enteredTitle = titleInputController.text;
   final enteredAmount = double.parse(amountInputController.text);

   if(enteredTitle.isEmpty || enteredAmount <= 0){
     return;
   }
    addTransaction(
        enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleInputController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountInputController,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
