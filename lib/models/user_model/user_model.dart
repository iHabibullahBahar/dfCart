class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userProfileImage;
  String? userDefaultAddressId;
  String? userBirthDate;

  List<UserAddresses>? userAddresses;

  UserModel(
      {this.userId,
      this.userName,
      this.userEmail,
      this.userPhone,
      this.userAddresses,
      this.userProfileImage,
      this.userDefaultAddressId,
      this.userBirthDate});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userProfileImage = json['user_profile_image'];
    userDefaultAddressId = json['default_address_id'];
    userBirthDate = json['user_birth_date'];

    if (json['user_addresses'] != null) {
      userAddresses = <UserAddresses>[];
      json['user_addresses'].forEach((v) {
        userAddresses!.add(new UserAddresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_phone'] = userPhone;
    data['user_profile_image'] = userProfileImage;
    data['user_default_address_id'] = userDefaultAddressId;
    data['user_birth_date'] = userBirthDate;
    if (userAddresses != null) {
      data['user_addresses'] = userAddresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class UserAddresses {
//   String? addressId;
//   String? address;
//   String? addressType;
//
//   UserAddresses({this.addressId, this.address, this.addressType});
//
//   UserAddresses.fromJson(Map<String, dynamic> json) {
//     addressId = json['address_id'];
//     address = json['address'];
//     addressType = json['address_type'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['address_id'] = addressId;
//     data['address'] = address;
//     data['address_type'] = addressType;
//     return data;
//   }
// }

class UserAddresses {
  String? addressId;
  String? fullName;
  String? phone;
  String? city;
  String? state;
  String? address;
  String? area;
  String? street;
  String? house;
  String? landmark;
  String? addressType;

  UserAddresses(
      {this.addressId,
      this.fullName,
      this.phone,
      this.city,
      this.state,
      this.address,
      this.area,
      this.street,
      this.house,
      this.landmark,
      this.addressType});

  UserAddresses.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    fullName = json['full_name'];
    phone = json['phone'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    area = json['area'];
    street = json['street'];
    house = json['house'];
    landmark = json['landmark'];
    addressType = json['address_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['area'] = this.area;
    data['street'] = this.street;
    data['house'] = this.house;
    data['landmark'] = this.landmark;
    data['address_type'] = this.addressType;
    return data;
  }
}
