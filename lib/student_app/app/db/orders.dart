import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../core/order.dart';

class OrderDatabase {
  static final OrderDatabase _orderDatabase = OrderDatabase._internal();
  static OrderDatabase get instance => _orderDatabase;
  static Database? db;

  static const String table = 'orders';

  // Get database instance
  Future<Database> get database async {
    if (db != null) {
      return db!;
    }

    db = await _init();
    return db!;
  }

  // Initialize database
  Future<Database> _init() async {
    return await openDatabase(join(await getDatabasesPath(), 'mavyorder.db'),
        onCreate: (db, version) async {
      // First time the database is created
      await db.execute(
          "CREATE TABLE $table (id INTEGER PRIMARY KEY, place TEXT, video TEXT,  firstImage TEXT,secondImage TEXT, latitude REAL, longitude REAL)");
      await db.execute(
          "CREATE TABLE settings (id INTEGER PRIMARY KEY, place TEXT, value TEXT)");
    }, version: 1);
  }

  // Get students
  Future<List<Order>> getStudents(String name) async {
    final List<Map<String, Object?>> result = await (await database).query(
      table,
      where: "place LIKE ?",
      whereArgs: ["%$name%"],
      orderBy: "id DESC",
    );
    return result.map((e) => Order.fromMap(e)).toList();
  }

  // Add student
  Future<int> addOrder(Order student) async {
    return await (await database).insert(table, student.toMap());
  }

  Future<int> updateOrder(Order updateOrder) async {
    final db = await database;
    return await db.update(
      table,
      updateOrder.toMap(),
      where: 'id = ?',
      whereArgs: [updateOrder.id],
    );
  }

  // Delete student
  Future<bool> deleteOrder(Order student) async {
    return await (await database)
            .delete(table, where: "id = ?", whereArgs: [student.id]) >
        0;
  }

  OrderDatabase._internal();
}
