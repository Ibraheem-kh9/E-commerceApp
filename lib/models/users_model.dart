class UsersModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? userPrivilege;

  UsersModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.userPrivilege,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      userPrivilege: json["userPrivilege"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "userPrivilege": this.userPrivilege,
    };
  }
//


}
