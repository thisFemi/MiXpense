import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';

import '../modules/transaction.dart';

class TransactionList extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final List<Transaction> transactions;
  final Function deleteTx;
  // const _bgcolor = availableColors[Colors.purple, Colors.yellow, Colors.black12] ;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: <Widget>[
              Text('No Transaction added!',
                  style: Theme.of(context).textTheme.bodyText1),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset('assets/images/transact.png',
                      fit: BoxFit.cover)),
            ]);
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
  }
}
