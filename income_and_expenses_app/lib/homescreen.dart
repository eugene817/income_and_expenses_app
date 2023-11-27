import 'package:flutter/material.dart';
import 'package:income_and_expenses_app/changeAccounts.dart';
import 'package:income_and_expenses_app/settingsScreen.dart';
import 'package:intl/intl.dart';
import 'package:income_and_expenses_app/database.dart';

//variables for income and expenses

// Colorscheme
const Color1 = Color.fromARGB(255, 140, 255, 152);
const Color2 = Color.fromARGB(255, 35, 17, 35);
const Color3 = Color.fromARGB(255, 209, 102, 102);
const Color4 = Color.fromARGB(255, 250, 232, 235);
const Color5 = Color.fromARGB(255, 94, 128, 127);

String currency = "zl";
  String income = "0";
  String expenses = "0";
  List<Operation> operations = [];
  List<Operation> incomeOperations = [];
  List<Operation> expenseOperations = [];

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}



class _homescreenState extends State<homescreen> {

    //load operations from data base // right now without user id
    Future<void> _loadOperations() async {
      final operations = await DatabaseHelper.instance.getOperations();

      setState(() {
      incomeOperations = operations.where((op) => op.description == 'Income').toList();
      expenseOperations = operations.where((op) => op.description == 'Expense').toList();
      });
    }
    
    //update total income and expenses from data base // right now without user id
    Future<void> updateTotals() async {
      final totalIncome = await DatabaseHelper.instance.getTotalIncome();
      final totalExpenses = await DatabaseHelper.instance.getTotalExpenses();

      setState(() {
        income = totalIncome.toString();
        expenses = totalExpenses.toString();
      });
    }

    //show add dialog to add operations //right now without categories
    Future<void> _showAddDialog(BuildContext context, bool isIncome) async {
    TextEditingController _textEditingController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color2,
          title: Text(
            isIncome ? 'Add Income' : 'Add Expense',
            style: TextStyle(
              color: Color4,
            ),
            ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: isIncome ? Color1 : Color3,
                    hintText: isIncome ? "income" : "expense",
                    hintStyle: TextStyle(
                      color: Color2,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color3, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color3,
                  ),
                  ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color1, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Color1,
                  ),
                  ),
                onPressed: () async{
                  // isIncome ? income = (double.parse(income) + double.parse(_textEditingController.text)).toString() :
                  // expenses = (double.parse(expenses) + double.parse(_textEditingController.text)).toString()
                  // ;
                  Operation newOperation = Operation(
                  description: isIncome ? "Income" : "Expense",
                  amount: _textEditingController.text,
                  date: DateTime.now(),
                  );

                  await DatabaseHelper.instance.addOperation(newOperation);

                  await _loadOperations();

                  await updateTotals();

                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );

    

  }

  //load operations and totals to a screen
  @override
  void initState() {
    super.initState();
    _loadOperations(); 
    updateTotals();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return mainScreen1(context, screenSize);
    // DefaultTabController (
    // length: 3,
    // child: Scaffold(

    //   appBar: AppBar(
    //   leading: Builder(
    //     builder: (BuildContext context) {
    //       return IconButton(
    //         onPressed: () {
    //          Scaffold.of(context).openDrawer();
    //         },
    //         icon: Icon(Icons.menu),
    //         iconSize: 40,
    //       );
    //     }
    //   ),
    //   backgroundColor: Color2,
    //   elevation: 10,
    //   title: const Text(
    //     "Incomes and expenses",
    //     style: TextStyle(
    //       color: Color4,
    //     ),
    //     ),
    //   actions: [
    //     IconButton(
    //       onPressed: () => Showstatisticschose(context),
    //       icon: Icon(Icons.calendar_month)
    //       )
    //   ],
    // ),
    // drawer: Drawer(
    //   backgroundColor: Color4,
    //   child: ListView(
    //     padding: EdgeInsets.zero,
    //     children: [
    //           DrawerHeader(
    //           decoration: BoxDecoration(
    //             color: Color2,
    //           ),
    //           child: Text(
    //             'Menu',
    //             style: TextStyle(
    //               color: Color4,
    //               fontSize: 24,
    //             ),
    //           ),
    //         ),
    //       ListTile(
    //         leading: Icon(Icons.auto_graph),
    //         title: Text(
    //           'Change user',
    //           style: TextStyle(
    //             fontSize: 20,
    //           ),
    //           ),
    //         onTap: () {
    //           // Navigator.push(context,
    //           //   MaterialPageRoute(builder: (context) => loginscreen())
    //           // );
    //       }),
    //       ListTile(
    //         leading: Icon(Icons.settings),
    //         title: Text(
    //           'Settings',
    //           style: TextStyle(
    //             fontSize: 20,
    //           ),
    //           ),
    //         onTap: () {
    //           Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => const settingsScreen())
    //           );
    //         },
    //       ),
    //       ListTile(
    //         leading: Icon(Icons.account_balance),
    //         title: Text(
    //           'Accounts',
    //           style: TextStyle(
    //             fontSize: 20,
    //           ),
    //           ),
    //         onTap: () {
    //           Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => const changeAccounts())
    //           );
    //         },
    //       ),
    //       // Add more items here
    //     ],
    //   ),
    // ),

    //   body: TabBarView(
    //   children: [
    //     mainScreen1(context, screenSize),
    //     mainScreen2(context, screenSize),
    //     mainScreen3(context, screenSize),
    //   ]
    // ),
    // bottomNavigationBar: BottomAppBar(
    //   child: Container(
    //     color: Color2,
    //     child: const TabBar(
    //               tabs: [
    //             Tab(icon: Icon(Icons.account_box_outlined)),
    //             Tab(icon: Icon(Icons.account_balance_outlined)),
    //             Tab(icon: Icon(Icons.account_balance_wallet_outlined)),
    //               ],
    //     ),
    //   )
    // ),
    // )
    
    
    // );
  }

  Scaffold mainScreen1(BuildContext context, Size screenSize) {
    
    return Scaffold(
    backgroundColor: Color2,
    body: Column(
      children: [
        SizedBox(height: screenSize.height / 40,),
        Text(
            "Income",
            style: TextStyle(
              color: Color5,
              fontSize: 30,
            ),
          ),
        SizedBox(height: screenSize.height / 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: screenSize.width - 100,
                maxWidth: screenSize.width - 100,
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
            SizedBox(width: 10,),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color1,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () => _showAddDialog(context, true),
                icon: Icon(Icons.add),
                iconSize: 30,
                hoverColor: Color5,
              ),
            )
          ],
        ),
        SizedBox(height: screenSize.height / 40,),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color1, width: 2)
          ),
          width: screenSize.width,
          height: screenSize.height / 5,
          child: incomeOperations.isNotEmpty 
            ? ListView.builder(
                itemCount: incomeOperations.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color2,
                      border: Border.all(color: Color1, width: 2)
                    ),
                    child: ListTile(
                      title: Text(
                        "${incomeOperations[index].amount} $currency",
                        style: TextStyle(
                          color: Color1,
                          fontSize: screenSize.height / 20,
                        ),
                        ),
                      subtitle: Text(
                        DateFormat('yyyy-MM-dd – kk:mm').format(incomeOperations[index].date),
                        style: TextStyle(
                          color: Color1,
                          fontSize: screenSize.height / 25,
                        ),
                        ),
                    ),
                  );
                },
              )
            : Center(child: Text(
              "No income operations",
              style: TextStyle(
                        color: Color1,
                        fontSize: screenSize.height / 30,
                      ),
              )),
        ),

        SizedBox(height: screenSize.height / 40,),

        Center(
          child: Text(
            "Expenses",
            style: TextStyle(
              color: Color3,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(height: screenSize.height / 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: screenSize.width - 100,
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
            SizedBox(width: 10,),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color3,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () => _showAddDialog(context, false),
                icon: Icon(Icons.add),
                iconSize: 30,
                hoverColor: Color4,
              ),
            )
          ],
        ),
        SizedBox(height: screenSize.height / 40,),
        
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color3, width: 1),
          ),
          width: screenSize.width,
          height: screenSize.height / 5,
          child: expenseOperations.isNotEmpty
            ? ListView.builder(
                itemCount: expenseOperations.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color3, width: 1),
                      color: Color2,
                    ),
                    child: ListTile(
                      title: Text(
                        "${expenseOperations[index].amount} $currency",
                        style: TextStyle(
                          color: Color3,
                          fontSize: screenSize.height / 20,
                        ),
                        ),
                      subtitle: Text(
                        DateFormat('yyyy-MM-dd – kk:mm').format(expenseOperations[index].date),
                        style: TextStyle(
                          color: Color3,
                          fontSize: screenSize.height / 25,
                        ),
                        ),
                    ),
                  );
                },
              )
            : Center(child: Text(
              "No expense operations",
              style: TextStyle(
                        color: Color3,
                        fontSize: screenSize.height / 30,
                      ),
              )),
        ),


      ],
    ),
    

    
  );
  }

  Scaffold mainScreen2(BuildContext context, Size screenSize) {
    return Scaffold(
      backgroundColor: Color2,
      body: Center(
        child: Text(
          "mainScreen2",
          style: TextStyle(
            color: Color4,
            fontSize: 50
          ),
          ),
      ),
    );
  }

  Scaffold mainScreen3(BuildContext context, Size screenSize) {
    return Scaffold(
      backgroundColor: Color2,
      body: Center(
        child: Text(
          "mainScreen3",
          style: TextStyle(
            color: Color4,
            fontSize: 50
          ),
          ),
      ),
    );
  }

  Future<String?> Showstatisticschose(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              
                title: const Text("Statistics for"),
                content: SizedBox(
                  width: screenSize.width,
                  height: screenSize.height - 400,
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



