import 'package:flutter/material.dart';
import 'package:income_and_expenses_app/homescreen.dart';
import 'package:income_and_expenses_app/registrationScreen.dart';

class loginscreen extends StatelessWidget {
  loginscreen({Key? key}) : super(key: key);

   final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Функция для аутентификации пользователя
  Future<void> authenticateUser(BuildContext context) async {
    // Получаем введенные данные
    String login = loginController.text;
    String password = passwordController.text;
    print(login);
    print(password);
    // Здесь ваш код для валидации и проверки данных с базой данных

    // Если данные верны, перенаправляем пользователя
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const homescreen()),
    );

    // Иначе показываем сообщение об ошибке
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color2,
      ),
      backgroundColor: Color4,
      body: Column(
        children: [
          SizedBox(height: 40,),
          Center(
            child: const Text(
              "Welcome back",
              style: TextStyle(
                fontSize: 30,
                color: Color2,
              ),
              )
            ),
            SizedBox(height: 30,),
            Text(
              "login:",
              style: TextStyle(
                fontSize: 30,
                color: Color2,
              ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: loginController,
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
                color: Color2,
              ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: passwordController,
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
              Container(
                constraints: BoxConstraints(
                  maxWidth: 300,
                  minWidth: 300
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color3,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () => {
                          Navigator.push(
                           context,
                            MaterialPageRoute(builder: (context) => const registrationScreen()),
                          ),
                        }, 
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Color4,
                          ),
                          ),
                        ),
                    ),
                    SizedBox(width: 158,),
                    Container(
                      decoration: BoxDecoration(
                        color: Color5,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () => authenticateUser(context),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Color4,
                          ),
                          ),
                        ),
                    ),
                  ],
                ),
              )
        ],
      ),

    );
  }
}