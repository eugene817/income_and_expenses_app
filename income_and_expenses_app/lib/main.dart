import 'package:flutter/material.dart';

//TODO : 
// 1.сделать страницу выезжающую справа на кнопку appbar - lead
// 2.добавить выезжающие странички на кнопки: 1) справав appbara 2) income add 3) expense add
// подключить базу данных и рвать жопу

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: Base(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

var income = "13435";
var expenses = "13215";

const Color1 = Color.fromARGB(255, 140, 255, 152);
const Color2 = Color.fromARGB(255, 35, 17, 35);
const Color3 = Color.fromARGB(255, 209, 102, 102);
const Color4 = Color.fromARGB(255, 250, 232, 235);
const Color5 = Color.fromARGB(255, 94, 128, 127);

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color4,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print("cool shit, thank you wery much, really appreciate that");
          },
          icon: Icon(Icons.menu),
          iconSize: 40,
        ),
        backgroundColor: Color5,
        elevation: 10,
        title: const Text(
          "Incomes and expenses",
          style: TextStyle(
            color: Color4,
          ),
          ),
        actions: [
          IconButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Chose data"),
                content: TextButton(
                  onPressed: () {}, 
                  child: const Text("data")
                  ),
                backgroundColor: Color4,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                    ),
                    TextButton (
                      onPressed: () => Navigator.pop(context, 'Ok'),
                      child: const Text("Ok"),
                    )
                ],
              ),
            ),
            icon: Icon(Icons.calendar_month)
            )
        ],
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Income: ",
              style: TextStyle(
                color: Color5,
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: 250,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color2, Color1]
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      income + "zl",
                      style: TextStyle(
                        color: Color4,
                        fontSize: 40
                      ),
                      
                      )
                    ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color1,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.add),
                  iconSize: 30,
                   hoverColor: Color1,
                  disabledColor: Color1,
                  focusColor: Color1,
                  highlightColor: Color1,
                  splashColor: Color1,
                ),
              )
            ],
          ),
          SizedBox(height: 20,),

          Container(
            height: 140,
            width: 400,
            decoration: BoxDecoration(
              color: Color2,
            ),
          ),


          SizedBox(height: 20,),

          Center(
            child: Text(
              "Expenses: ",
              style: TextStyle(
                color: Color3,
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: 250,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color3, Color2]
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      expenses + "zl",
                      style: TextStyle(
                        color: Color4,
                        fontSize: 40
                      ),
                      
                      )
                    ),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Color3,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  iconSize: 30,
                  hoverColor: Color3,
                  disabledColor: Color3,
                  focusColor: Color3,
                  highlightColor: Color3,
                  splashColor: Color3,
                ),
              )
            ],
          ),
          SizedBox(height: 20,),

          Container(
            height: 140,
            width: 400,
            decoration: BoxDecoration(
              color: Color2,
            ),
          ),


          SizedBox(height: 20,),

        ],
      ),
      

      
    );
  }
}

// enum Page{General, Income, Expenses}

// class ChoosePage extends StatefulWidget {
//   const ChoosePage({super.key});

//   @override
//   State<ChoosePage> createState() => _ChoosePageState();
// }

// class _ChoosePageState extends State<ChoosePage> {
//   Page pageView = Page.General;

//   @override
//   Widget build(BuildContext context) {
//     return SegmentedButton<Page>(
//       style: ButtonStyle(
//       ),
//       segments: const <ButtonSegment<Page>>[
//         ButtonSegment<Page>(
//           value: Page.General,
//           label: Text("General"),
//           icon: Icon(Icons.cake)
//         ),
//         ButtonSegment<Page>(
//           value: Page.Expenses,
//           label: Text("Expenses"),
//           icon: Icon(Icons.balance)
//         ),
//         ButtonSegment<Page>(
//           value: Page.Income,
//           label: Text("Income"),
//           icon: Icon(Icons.money)
//         )
//       ], 
//       selected: <Page>{pageView},
//       onSelectionChanged: (Set<Page> newSelection) {
//         setState(() {
//           pageView = newSelection.first;
//         });
//       },
//       );
//   }