// import 'package:expense_tracker/home_screen.dart';
import 'package:expense_tracker/backend.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/constants.dart';
import 'package:provider/provider.dart';

class TopButtons extends StatelessWidget {
  // final List<bool> selected;
  // final Function buttonFunction;
  // TopButtons(
  //   // this.selected,
  //   //  this.buttonFunction
  // );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900,
                  offset: const Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.grey.shade800,
                  offset: const Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
        child: ToggleButtons(
          borderRadius: BorderRadius.circular(30),
          renderBorder: false,
          borderColor: Colors.grey[700],
          fillColor: Colors.grey[700],
          color: Colors.black,
          selectedColor: Colors.greenAccent,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'All',
                style: kButtonTextStyle,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Expenses',
                style: kButtonTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Income',
                style: kButtonTextStyle,
              ),
            ),
          ],
          isSelected: Provider.of<BackEnd>(context).selected,
          onPressed: (int newIndex) {
            Provider.of<BackEnd>(
              context,
              listen: false,
            ).selectNewType(newIndex);
          },
        ),
      ),
    );
  }
}
