class UserModel{

  String? name;
  String? mobileNum;
  String?userType;

  UserModel({this.name, this.mobileNum, this.userType});


  // Serialize: Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobileNum': mobileNum,
      'userType': userType,
    };
  }

  // Deserialize: Convert JSON to UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      mobileNum: json['mobileNum'],
      userType: json['userType'],
    );
  }




}