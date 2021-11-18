import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/backend.dart';
import 'package:expense_tracker/widgets/transaction_card.dart';

class Expense extends StatelessWidget {
  const Expense({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<BackEnd>(context).expenseList.length,
      itemBuilder: (context, index) {
        return TransactionCard(
            transactionName: Provider.of<BackEnd>(context).expenseList[index]
                [0],
            money: Provider.of<BackEnd>(context).expenseList[index][1],
            expenseOrIncome: Provider.of<BackEnd>(context).expenseList[index]
                [2]);
      },
    );
  }
}
