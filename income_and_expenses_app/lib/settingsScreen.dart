import 'package:flutter/material.dart';

import 'package:income_and_expenses_app/homescreen.dart';

class settingsScreen extends StatelessWidget {
  const settingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color4,
      
        appBar: AppBar(
          backgroundColor: Color2,
          elevation: 1,
          title: Text(
            "Settings"
            ),
        ),

    );
  }
}
