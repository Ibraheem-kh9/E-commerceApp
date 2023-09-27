import 'package:e_commerce_app/models/cart_model.dart';
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
    return _db;
  }

  initDatabase() async {
    try{
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentDirectory.path, 'cart.db');
      var db = await openDatabase(path, version: 1, onCreate: _onCreate);
      return db;
    }catch (e){
       return MissingPlatformDirectoryException('No Directory Found');
    }

  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY AUTOINCREMENT, itemId INTEGER UNIQUE,itemName TEXT,itemQty INTEGER, itemPrice REAL , itemTotalPrices REAL, itemImage TEXT )');
  }

  Future<List<CartModel>?> getDbData() async {
    var dbClient = await db;
    final List<Map<String, dynamic>>? dbResult = await dbClient?.query('cart');
    return dbResult?.map((e) => CartModel.fromJson(e)).toList();

  }

  Future<int> insertDb(CartModel cartModel) async {
    var dbClient = await db;
    int response = await dbClient!.insert('cart', cartModel.toJson());
    return response;
  }


  Future<int> deleteItemFromCart(int id) async {
    var dbClient = await db;
    return await dbClient!.delete(
      'cart',
      where: 'itemId = ?',
      whereArgs: [id],
    );
  }

  Future<List<CartModel>> getItemById(int id) async {
    var dbClient = await db;
    var data =  await dbClient!.query(
      'cart',
      where: ' itemId =   ?',
      whereArgs: [id],
    );
    return data.map((e) => CartModel.fromJson(e)).toList();
  }
}
