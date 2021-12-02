import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingCircle extends StatelessWidget {
  const LoadingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 30,
        // width: 30,
        child: const SpinKitThreeBounce(
          color: Colors.greenAccent,
          size: 33.0,
        ),
      ),
    );
  }
}
