import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
       itemBuilder: (context, index) {
         return Card(
           child: Row(
             children: [
               Container(
                 padding: EdgeInsets.all(10),
                 margin: EdgeInsets.symmetric(
                   vertical: 10,
                   horizontal: 15,
                 ),
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.purple,
                     width: 2,
                   ),
                   // shape: BoxShape.circle,
                 ),
                 child: Text(
                   "\$${transactions[index].amount.toStringAsFixed(2)}",
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.purple,
                   ),
                 ),
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     transactions[index].title,
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: Colors.black,
                     ),
                   ),
                   SizedBox(height: 10),
                   Text(
                     DateFormat.yMMMMd().format(transactions[index].date),
                     style: TextStyle(
                       fontSize: 14,
                       color: Colors.grey,
                     ),
                   ),
                 ],
               ),
             ],
           ),
         );
       },
        itemCount: transactions.length,
      ),
    );
  }
}
