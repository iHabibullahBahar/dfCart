class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  List<UserAddresses>? userAddresses;

  UserModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userAddresses});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    if (json['user_addresses'] != null) {
      userAddresses = <UserAddresses>[];
      json['user_addresses'].forEach((v) {
        userAddresses!.add(new UserAddresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    if (this.userAddresses != null) {
      data['user_addresses'] =
          this.userAddresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserAddresses {
  String? addressId;
  String? addressName;
  String? address;
  String? addressType;

  UserAddresses(
      {this.addressId, this.addressName, this.address, this.addressType});

  UserAddresses.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    address = json['address'];
    addressType = json['address_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address'] = this.address;
    data['address_type'] = this.addressType;
    return data;
  }
}
