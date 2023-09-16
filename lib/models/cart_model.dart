class CartModel {
  int? id;
  int? itemId;
  String? itemName;
  int? itemQty;
  double? itemPrice;
  double? itemTotalPrices;
  String? itemImage;

  CartModel({
    this.id,
    this.itemId,
    this.itemName,
    this.itemImage,
    this.itemQty,
    this.itemPrice,
    this.itemTotalPrices,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json["id"],
      itemId: json["itemId"],
      itemName: json["itemName"],
      itemImage: json["itemImage"],
      itemQty: json["itemQty"],
      itemPrice: json["itemPrice"],
      itemTotalPrices: json["itemTotalPrices"],
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
    };
  }
}
