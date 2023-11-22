import 'package:flutter/material.dart';
import 'package:income_and_expenses_app/homescreen.dart';
import 'package:income_and_expenses_app/loginscreen.dart';

class registrationScreen extends StatelessWidget {
  const registrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color4,
      appBar: AppBar(
        title: Text(
          "Register"
          ),
          backgroundColor: Color2,
          ),
      body: Column(
        children: [
          
          SizedBox(height: 40,),
            Text(
              "Name:",
              style: TextStyle(
                fontSize: 30,
                color: Color2,
              ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color4,
                    hintText: "your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 30,),
            Text(
              "Email(login):",
              style: TextStyle(
                fontSize: 30,
                color: Color2,
              ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color4,
                    hintText: "your email/login",
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
                color: Color2,
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
              SizedBox(height: 50,),
              Row(
                children: [
                ],
              )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color5,
        child: TextButton(
          child: Text(
            "Register",
            style: TextStyle(
              color: Color4,
              fontSize: 30,
            ),
            ),
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  loginscreen()),
            );
          }, 
        ),
      ),
    );
  }
}