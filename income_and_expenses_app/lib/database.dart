import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// import 'dart:convert';
// import 'package:crypto/crypto.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // add operation to data base
  Future<void> addOperation(Operation operation) async {
    final db = await database;
    await db.insert(
      'operations',
      operation.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  
  //get operation from data base
   Future<List<Operation>> getOperations() async {
    final db = await database;
    final result = await db.query('operations'); // Получаем данные из таблицы 'operations'

    // Преобразуем List<Map<String, dynamic>> в List<Operation>
    return result.map((map) => Operation.fromMap(map)).toList();
  }

  Future<void> addCategory(CategoryOperations category) async {
  final db = await database;
  await db.insert(
    'categories',
    category.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

  Future<List<CategoryOperations>> getCategories() async {
  final db = await database;
  final result = await db.query('categories');
  return result.map((map) => CategoryOperations.fromMap(map)).toList();
}

  //get total income from data base
  Future<double> getTotalIncome() async {
    final db = await database;
    var result = await db.rawQuery('SELECT SUM(amount) as total FROM operations WHERE description = "Income"');
    return double.tryParse(result[0]['total'].toString()) ?? 0.0;
  }

  //get total expense from data base
  Future<double> getTotalExpenses() async {
    final db = await database;
    var result = await db.rawQuery('SELECT SUM(amount) as total FROM operations WHERE description = "Expense"');
    return double.tryParse(result[0]['total'].toString()) ?? 0.0;
  }

  //create data base //right now operations only
  Future _createDB(Database db, int version) async {

    await db.execute('''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      type TEXT
      )
    ''');

    await db.execute('''
    CREATE TABLE operations (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      amount TEXT,
      date TEXT,
      description TEXT,
      category TEXT
      )
    ''');

  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}


// class for operation
class Operation {
  int ?id; 
  String description;
  String amount;
  DateTime date;
  String category;

  Operation({this.id, required this.description, required this.amount, required this.date, required this.category});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'date': date.toIso8601String(),
      'category' : category,
    };
  }

  Operation.fromMap(Map<String, dynamic> map) :
    id = map['id'] as int?,
    description = map['description'] as String,
    amount = map['amount'] as String,
    date = DateTime.parse(map['date']),
    category = map['category'] as String;
 }

 class CategoryOperations {
    int ?id;
    String name;
    String type;

    CategoryOperations({this.id, required this.name, required this.type});

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }

  CategoryOperations.fromMap(Map<String, dynamic> map) :
    id = map['id'] as int?,
    name = map['name'] as String,
    type = map['type'] as String;

 }