// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;
  final int? favorite;
  final int? itemQty;
  final int? itemActive;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
    this.favorite,
    this.itemQty,
    this.itemActive,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    favorite: json["favorite"],
    itemQty: json["item_qty"],
    itemActive: json["item_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "favorite": favorite,
    "item_qty": itemQty,
    "item_active": itemActive,
  };
}



/*
import 'dart:convert';
import 'package:flutter/material.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
    this.isFavorite = false,
    this.quantity = 0,
    this.totalProductPrice = 0.0,
  });

  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;
  late bool? isFavorite ;
  int quantity ;
  // change dynamic to double
  double? totalProductPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    // should be else false to avoid the null value when fetch api product
    isFavorite: json["isFavorite"] ?? false,
    quantity: json["quantity"] ?? 0,
    totalProductPrice: json["totalProductPrice"] ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "isFavorite": isFavorite,
    "quantity": quantity,
    "totalProductPrice": totalProductPrice,
  };
}
*/
