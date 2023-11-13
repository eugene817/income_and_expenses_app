import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:income_and_expenses_app/homescreen.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color2,
      body: Column(
        children: [
          SizedBox(height: 40,),
          Center(
            child: const Text(
              "Welcome back",
              style: TextStyle(
                fontSize: 30,
                color: Color4,
              ),
              )
            ),
            SizedBox(height: 30,),
            Text(
              "login:",
              style: TextStyle(
                fontSize: 30,
                color: Color4,
              ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color4,
                    hintText: "your login",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
            Text(
              "Password:",
              style: TextStyle(
                fontSize: 30,
                color: Color4,
              ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color4,
                    hintText: "your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 100,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color3,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () => {}, 
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color4,
                        ),
                        ),
                      ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color5,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () => {}, 
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          color: Color4,
                        ),
                        ),
                      ),
                  ),
                ],
              )
        ],
      ),

    );
  }
}