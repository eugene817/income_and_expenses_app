import 'package:flutter/material.dart';
// import 'package:income_and_expenses_app/homescreen.dart';
// import 'package:income_and_expenses_app/loginscreen.dart';
import 'package:income_and_expenses_app/homescreen.dart';
var currentUserId;

void main() {
  runApp(
     MaterialApp(
      title: 'income_and_expenses_app',
      home: homescreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

