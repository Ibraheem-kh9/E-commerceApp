import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;

class DbHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY , itemId INTEGER UNIQUE,itemName TEXT,itemQty INTEGER, itemPrice REAL , itemTotalPrices REAL, itemImage TEXT )');
    //'CREATE TABLE cart (id INTEGER PRIMARY KEY , itemId INTEGER UNIQUE,itemName TEXT,itemQty INTEGER, itemPrice INTEGER , itemTotalPrices INTEGER, itemImage TEXT )');
  }

  Future<CartModel> insertDb(CartModel cartModel) async {
    print(cartModel.toJson());
    var dbClient = await db;
    await dbClient?.insert('cart', cartModel.toJson());

    return cartModel;
  }

  Future<List<CartModel>> getDbData() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> dbResult = await dbClient!.query('cart');
    return dbResult.map((e) => CartModel.fromJson(e)).toList();
  }

  Future<int> deleteItemFromCart(int id) async {
    var dbClient = await db;
    return await dbClient!.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, Object?>>> getItemById(int qty) async {
    var _dbClinet = await db;
    return await _dbClinet!.query(
      'cart',
      where: ' itemQty = ?',
      whereArgs: [qty],
    );
  }
}
