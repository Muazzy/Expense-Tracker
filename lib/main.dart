// ignore_for_file: use_key_in_widget_constructors

import 'package:expense_tracker/backend.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final BackEnd backEnd = BackEnd();
  runApp(MyApp(backEnd));
}

class MyApp extends StatelessWidget {
  final BackEnd _backEnd;
  const MyApp(this._backEnd);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BackEnd(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
