import 'package:flutter/material.dart';
// import 'package:income_and_expenses_app/homescreen.dart';
import 'package:income_and_expenses_app/loginscreen.dart';

void main() {
  runApp(
     MaterialApp(
      title: 'income_and_expenses_app',
      home: loginscreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

