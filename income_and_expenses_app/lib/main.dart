import 'package:flutter/material.dart';
import 'package:income_and_expenses_app/homescreen.dart';
import 'package:income_and_expenses_app/loginscreen.dart';

//TODO : 
// 2.добавить выезжающие странички на кнопки: 2) income add 3) expense add
// подключить базу данных и рвать жопу

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: loginscreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

