// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:expense_tracker/screens/expense_screen.dart';
import 'package:expense_tracker/screens/income_screen.dart';
import 'package:expense_tracker/screens/transaction_screen.dart';
import 'package:expense_tracker/widgets/button.dart';
import 'package:expense_tracker/widgets/loading_widget.dart';
import 'package:expense_tracker/widgets/top_buttons.dart';
import 'package:expense_tracker/widgets/top_card.dart';
import 'package:flutter/material.dart';

List<bool> selected = [true, false, false];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(
            children: [
              TopButtons(selected: selected),
              SizedBox(height: 20),
              TopNeuCard(balance: '1500', expense: '300', income: '1800'),
              SizedBox(height: 15),
              Expanded(
                child: Transactions(),
              ),
              PlusButton(
                function: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
