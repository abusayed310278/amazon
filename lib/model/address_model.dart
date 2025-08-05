class AddressModel{

  String? name;
  String? mobileNumber;
  String? houseNumber;
  String? area;
  String? landMark;
  String? pincode;
  String? town;
  String? state;
  bool? isDefault;

  AddressModel({
    this.name,
    this.mobileNumber,
    this.houseNumber,
    this.area,
    this.landMark,
    this.pincode,
    this.town,
    this.state,
    this.isDefault,
  });

  // Serialize: Convert AddressModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobileNumber': mobileNumber,
      'houseNumber': houseNumber,
      'area': area,
      'landMark': landMark,
      'pincode': pincode,
      'town': town,
      'state': state,
      'isDefault': isDefault,
    };
  }

  // Deserialize: Convert JSON to AddressModel
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      name: json['name'],
      mobileNumber: json['mobileNumber'],
      houseNumber: json['houseNumber'],
      area: json['area'],
      landMark: json['landMark'],
      pincode: json['pincode'],
      town: json['town'],
      state: json['state'],
      isDefault: json['isDefault'],
    );
  }



}