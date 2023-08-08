class FavoriteModel {
  int? favoriteItemId;
  String? favoriteItemName;
  int? favoriteItemDiscount;
  int favoriteQty;
  /// change dynamic to double
  double? favoriteItemPrice;
  String? favoriteImage;
  bool isFavorite ;
  double? favoriteTotalPrice;
  //bool isAdded;

  FavoriteModel({
    this.favoriteItemId,
    this.favoriteItemName,
    this.favoriteItemDiscount,
    this.favoriteQty = 0,
    this.favoriteItemPrice,
    this.favoriteImage,
    this.isFavorite = false,
    this.favoriteTotalPrice,
    //this.isAdded = false,
  });

  // factory FavoriteModel.fromJson(Map<String, dynamic> json) {
  //   return FavoriteModel(
  //     favoriteItemId: int.parse(json["favoriteItemId"]),
  //     favoriteItemName: json["favoriteItemName"],
  //     favoriteItemDiscount: int.parse(json["favoriteItemDiscount"]),
  //     favoriteItemPrice: json["favoriteItemPrice"],
  //     favoriteImage: json["favoriteImage"],
  //     isFavorite: json["isFavorite"].toLowerCase() == 'true',
  //     isAdded: json["isAdded"].toLowerCase() == 'true',
  //   );
  // }

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      favoriteItemId: json["favoriteItemId"],
      //favoriteItemId: int.parse(json["favoriteItemId"]),
      favoriteItemName: json["favoriteItemName"],
      favoriteItemDiscount: json["favoriteItemDiscount"],
      favoriteQty: json["favoriteQty"],
      favoriteItemPrice: json["favoriteItemPrice"],
      favoriteImage: json["favoriteImage"],
      isFavorite: json["isFavorite"] ?? false,
      favoriteTotalPrice: json["favoriteTotalPrice"] ?? 0.0,
     // isAdded: json["isAdded"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "favoriteItemId": this.favoriteItemId,
      "favoriteItemName": this.favoriteItemName,
      "favoriteItemDiscount": this.favoriteItemDiscount,
      "favoriteQty": this.favoriteQty,
      "favoriteItemPrice": this.favoriteItemPrice,
      "favoriteImage": this.favoriteImage,
      "isFavorite": this.isFavorite,
      "favoriteTotalPrice": this.favoriteTotalPrice,
     // "isAdded": this.isAdded,
    };
  }
//


}
