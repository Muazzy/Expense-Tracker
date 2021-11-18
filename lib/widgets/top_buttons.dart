// import 'package:expense_tracker/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/constants.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({
    Key? key,
    required this.selected,
  }) : super(key: key);

  final List<bool> selected;

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
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
          isSelected: widget.selected,
          onPressed: (int newIndex) {
            setState(
              () {
                for (int index = 0; index < widget.selected.length; index++) {
                  if (index == newIndex) {
                    widget.selected[index] = true;
                  } else {
                    widget.selected[index] = false;
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}
