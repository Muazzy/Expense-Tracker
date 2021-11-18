import 'package:flutter/material.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        width: 30,
        child: const CircularProgressIndicator(
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}
