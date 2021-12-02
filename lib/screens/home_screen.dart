// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, dead_code

import 'package:expense_tracker/backend.dart';
import 'package:expense_tracker/screens/expense_screen.dart';
import 'package:expense_tracker/screens/income_screen.dart';
import 'package:expense_tracker/screens/transaction_screen.dart';
import 'package:expense_tracker/widgets/add_button.dart';
import 'package:expense_tracker/widgets/loading_widget.dart';
import 'package:expense_tracker/widgets/top_buttons.dart';
import 'package:expense_tracker/widgets/top_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  // final _textcontrollerAMOUNT = TextEditingController();
  // final _textcontrollerITEM = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
  // bool _isIncome = false;

  @override
  Widget build(BuildContext context) {
    // void enterTransaction() {
    //   Provider.of<BackEnd>(context).insertTransaction(
    //       _textcontrollerITEM.text, _textcontrollerAMOUNT.text, _isIncome);
    // }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddButton(),
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              TopButtons(),
              SizedBox(height: 20),
              TopNeuCard(balance: '1500', expense: '300', income: '1800'),
              SizedBox(height: Provider.of<BackEnd>(context).loading ? 0 : 15),
              Expanded(
                child: Provider.of<BackEnd>(context).loading
                    ? LoadingCircle()
                    : getRequiredWidget(
                        Provider.of<BackEnd>(context).selectedType),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //this will return the widget based on the index number that we provide
  Widget getRequiredWidget(int index) {
    if (index == 1) {
      return Expense();
    } else if (index == 2) {
      return Income();
    }
    return Transactions();
  }
}
