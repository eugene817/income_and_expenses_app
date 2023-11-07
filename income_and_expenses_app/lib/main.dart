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
      backgroundColor: Color2,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
               Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
              iconSize: 40,
            );
          }
        ),
        backgroundColor: Color2,
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
                  title: const Text("Statistics for"),
                  content: SizedBox(
                    width: 300,
                    height: 300,
                    child: RadioChooseDate()
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color2,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Color4,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            // Add more items here
          ],
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Text(
              "Income",
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
                    colors: [Color1, Color2]
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
                  hoverColor: Color5,
                ),
              )
            ],
          ),
          SizedBox(height: 20,),

          ScrollIncome(),


          SizedBox(height: 20,),

          Center(
            child: Text(
              "Expenses",
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
                  hoverColor: Color4,
                ),
              )
            ],
          ),
          SizedBox(height: 20,),
          
          ScrollExpenses(),

          SizedBox(height: 20,),

        ],
      ),
      

      
    );
  }
}

enum DatePick {Day, Month, Year, Week, Custom}

class RadioChooseDate extends StatefulWidget {
  const RadioChooseDate({
    super.key,
  });

  @override
  State<RadioChooseDate> createState() => _RadioChooseDateState();
}

class _RadioChooseDateState extends State<RadioChooseDate> {
  DatePick? _date = DatePick.Day;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text("Day"),
          leading: Radio<DatePick>(
            value: DatePick.Day,
            groupValue: _date,
            onChanged: (DatePick? value) {
              setState(() {
                _date = value;
              });
            },
          ),
        ),
         ListTile(
          title: const Text("Week"),
          leading: Radio<DatePick>(
            value: DatePick.Week,
            groupValue: _date,
            onChanged: (DatePick? value) {
              setState(() {
              _date = value;
          });
        }
        
      ),
    ),
        ListTile(
          title: const Text("Month"),
          leading: Radio<DatePick>(
            value: DatePick.Month,
            groupValue: _date,
            onChanged: (DatePick? value) {
              setState(() {
              _date = value;
          });
        }
        
      ),
    ),
    ListTile(
          title: const Text("Year"),
          leading: Radio<DatePick>(
            value: DatePick.Year,
            groupValue: _date,
            onChanged: (DatePick? value) {
              setState(() {
              _date = value;
          });
        }
        
      ),
    ),
    ListTile(
          title: const Text("Custom"),
          leading: Radio<DatePick>(
            value: DatePick.Custom,
            groupValue: _date,
            onChanged: (DatePick? value) {
              setState(() {
              _date = value;
          });
        }
        
      ),
    ),
      ],
    );
  }
}

class ScrollIncome extends StatefulWidget {
  const ScrollIncome({super.key});

  @override
  State<ScrollIncome> createState() => _ScrollIncomeState();
}

class _ScrollIncomeState extends State<ScrollIncome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 360,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    alignment:  Alignment.center,
                    color: Color1,
                    child: Text("List item $index"),
                  ),
                );
              }
            ),
            itemExtent: 50.0,
            ),
        ],
      ),
    );
  }
}

class ScrollExpenses extends StatefulWidget {
  const ScrollExpenses({super.key});

  @override
  State<ScrollExpenses> createState() => _ScrollExpensesState();
}

class _ScrollExpensesState extends State<ScrollExpenses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 360,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    alignment:  Alignment.center,
                    color: Color3,
                    child: Text("List item $index"),
                  ),
                );
              }
            ),
            itemExtent: 50.0,
            ),
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