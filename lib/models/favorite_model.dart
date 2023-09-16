class FavoriteModel {
  int? id;
  String? favTitle;
  int? favPrice;
  String? favDescription;
  int? favDiscount;
  DateTime? favItemCreate;
  String? favImage;
  int? favProcess;

  FavoriteModel(
      {this.id,
      this.favTitle,
      this.favPrice,
      this.favDescription,
      this.favDiscount,
      this.favItemCreate,
      this.favImage,
      this.favProcess});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        favTitle: json["favTitle"],
        favPrice: json["favPrice"],
        favDescription: json["favDescription"],
        favDiscount: json["favDiscount"],
        favItemCreate: json["favItemCreate"],
        favImage: json["favImage"],
        favProcess: json["favProcess"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "favTitle": this.favTitle,
      "favPrice": this.favPrice,
      "favDescription": this.favDescription,
      "favDiscount": this.favDiscount,
      "favItemCreate": this.favItemCreate?.toIso8601String(),
      "favImage": this.favImage,
      "favProcess": this.favProcess,
    };
  }
}
