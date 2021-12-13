import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_tracker/backend.dart';
import 'package:expense_tracker/widgets/transaction_card.dart';

class Income extends StatelessWidget {
  const Income({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<BackEnd>(context).incomeList.length,
      itemBuilder: (context, index) {
        return TransactionCard(
            transactionName: Provider.of<BackEnd>(context).incomeList[index][0],
            money: Provider.of<BackEnd>(context).incomeList[index][1],
            expenseOrIncome: Provider.of<BackEnd>(context).incomeList[index]
                [2]);
      },
    );
  }
}
