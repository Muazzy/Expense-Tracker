// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String transactionName;
  final String money;
  final String expenseOrIncome;

  TransactionCard({
    required this.transactionName,
    required this.money,
    required this.expenseOrIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(15),
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[850]),
                    child: Center(
                      child: expenseOrIncome == 'expense'
                          ? Icon(
                              Icons.money_off,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.attach_money,
                              color: Colors.white,
                            ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    transactionName,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                (expenseOrIncome == 'expense' ? '-' : '+') + money + 'rs',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: expenseOrIncome == 'expense'
                      ? Colors.red[900]
                      : Colors.green[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
