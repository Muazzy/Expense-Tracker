// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:expense_tracker/backend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  // final Function? function;
  // AddButton({this.function});
  final _textcontrollerAMOUNT = TextEditingController();
  final _textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 10,
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return AlertDialog(
                        backgroundColor: Colors.grey[850],
                        title: const Text(
                          'N E W  T R A N S A C T I O N',
                          style: TextStyle(
                            color: Colors.greenAccent,
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Expense',
                                    style:
                                        TextStyle(color: Colors.grey.shade50),
                                  ),
                                  Switch(
                                    activeColor: Colors.greenAccent,
                                    inactiveThumbColor: Colors.red.shade200,
                                    inactiveTrackColor: Colors.red,
                                    value:
                                        Provider.of<BackEnd>(context).isIncome,
                                    onChanged: (newValue) {
                                      Provider.of<BackEnd>(context,
                                              listen: false)
                                          .toggleIsIncome(newValue);
                                    },
                                  ),
                                  Text(
                                    'Income',
                                    style:
                                        TextStyle(color: Colors.grey.shade50),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        cursorColor: Colors.greenAccent,
                                        style:
                                            TextStyle(color: Colors.grey[50]),
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.greenAccent,
                                            ),
                                          ),
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade600),
                                          focusColor: Colors.greenAccent,
                                          // suffixStyle: TextStyle(
                                          //     color: Colors.grey.shade50),
                                          border: OutlineInputBorder(),
                                          hintText: 'Amount?',
                                        ),
                                        validator: (text) {
                                          if (text == null || text.isEmpty) {
                                            return 'Enter an amount';
                                          }
                                          return null;
                                        },
                                        controller: _textcontrollerAMOUNT,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      cursorColor: Colors.greenAccent,
                                      style: TextStyle(color: Colors.grey[50]),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.greenAccent,
                                          ),
                                        ),
                                        border: OutlineInputBorder(),
                                        hintText: 'For what?',
                                        hintStyle: TextStyle(
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      controller: _textcontrollerITEM,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            color: Colors.grey[800],
                            child: Text('Cancel',
                                style: TextStyle(color: Colors.grey.shade100)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          MaterialButton(
                            color: Colors.grey[800],
                            child: Text('Enter',
                                style: TextStyle(color: Colors.grey.shade100)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Provider.of<BackEnd>(context, listen: false)
                                    .insertTransaction(
                                  _textcontrollerITEM.text,
                                  _textcontrollerAMOUNT.text,
                                  Provider.of<BackEnd>(context, listen: false)
                                      .isIncome,
                                );
                                Navigator.of(context).pop();
                              }
                            },
                          )
                        ],
                      );
                    },
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.grey[850],
            size: 25,
          ),
          backgroundColor: Colors.greenAccent,
        ),
      ),
    );
  }
}
