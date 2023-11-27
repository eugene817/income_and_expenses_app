import 'package:flutter/material.dart';
import 'package:income_and_expenses_app/homescreen.dart';
import 'package:income_and_expenses_app/database.dart';

var currentUserId;

class loginscreen extends StatelessWidget {
  loginscreen({Key? key}) : super(key: key);

   final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Функция для аутентификации пользователя
   Future<void> authenticateUser(BuildContext context) async {
    String login = loginController.text;
    String password = passwordController.text;

    var user = await DatabaseHelper.instance.getUser(login);

    if (user != null && user.passwordHash == generateHash(password)) {
      // Если пользователь найден и пароль верный
      currentUserId = user.id;
      //print(user.id);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const homescreen()),
      );
    } else {
      // Если данные неверные
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Incorrect login or password'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
   }

   Future<void> registerUser(BuildContext context) async {
    String login = loginController.text;
    String password = passwordController.text;

    // Проверяем, существует ли уже пользователь с таким логином
    var existingUser = await DatabaseHelper.instance.getUser(login);
    if (existingUser != null) {
      // Пользователь уже существует
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('User already exists'),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    // Хешируем пароль
    String passwordHash = generateHash(password);

    // Создаем нового пользователя
    User newUser = User(name: login, email: login, passwordHash: passwordHash); // Дополните полями, как требуется
    await DatabaseHelper.instance.createUser(newUser);

    // Показываем сообщение об успешной регистрации
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('User successfully registered'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                        onPressed: () => registerUser(context), 
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