class CartModel {
  late int? id;
  int? itemId;
  String? itemName;
  dynamic itemQty;
  /// change dynamic to double
  double? itemPrice;
  double? itemTotalPrices;
  String? itemImage;
  //dynamic cartTotalPrice;

  CartModel({
    this.id,
    this.itemId,
    this.itemName,
    this.itemImage,
    this.itemQty,
    this.itemPrice,
    this.itemTotalPrices,
   // this.cartTotalPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"],
      itemId: json["itemId"],
      itemName: json["itemName"],
      itemImage: json["itemImage"],
      itemQty: json["itemQty"] ,
      itemPrice: json["itemPrice"],
      itemTotalPrices: json["itemTotalPrices"],
     // cartTotalPrice: json["cartTotalPrice"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "itemId": this.itemId,
      "itemName": this.itemName,
      "itemImage": this.itemImage,
      "itemQty": this.itemQty,
      "itemPrice": this.itemPrice,
      "itemTotalPrices": this.itemTotalPrices,
     // "cartTotalPrice": this.cartTotalPrice,
    };
  }

}
