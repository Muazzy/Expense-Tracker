import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function? function;
  AddButton({this.function});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 10,
          onPressed: () {
            function;
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
