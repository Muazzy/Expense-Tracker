import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  final function;

  PlusButton({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '+',
            style: TextStyle(color: Colors.grey[850], fontSize: 30),
          ),
        ),
      ),
    );
  }
}
