import 'package:dfcart/config/config.dart';
import 'package:dfcart/config/personalize.dart';
import 'package:dfcart/controllers/user_info_controller.dart';
import 'package:dfcart/models/user_model/user_model.dart';
import 'package:dfcart/widgets/account_screen_widgets/profile_element_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userInfoController = Get.put(UserInfoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: primaryColor),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() {
        if (userInfoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          UserModel user = userInfoController.userInfo;
          UserAddresses defaultAddress = user.userAddresses![0];
          for (int i = 0; i < user.userAddresses!.length; i++) {
            if (user.userAddresses![i].addressId == user.userDefaultAddressId) {
              defaultAddress = user.userAddresses![i];
            }
          }
          return ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              //--------------------------------- Basic Profile Info -------------------------------//
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage(user.userProfileImage.toString()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //--------------------------------- User Info -------------------------------//
              ProfileElementWidget(
                  title: "Name", value: user.userName.toString()),
              const SizedBox(
                height: 5,
              ),
              ProfileElementWidget(
                  title: "Email", value: user.userEmail.toString()),
              const SizedBox(
                height: 5,
              ),
              ProfileElementWidget(
                  title: "Phone Number", value: user.userPhone.toString()),
              const SizedBox(
                height: 5,
              ),
              ProfileElementWidget(
                  title: "Birth Date", value: user.userBirthDate.toString()),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        child: Text(
                          'Default Address',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          AddressLineWidget(
                            text: defaultAddress.fullName.toString(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AddressLineWidget(
                            text: defaultAddress.phone.toString(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AddressLineWidget(
                            text: defaultAddress.address.toString(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AddressLineWidget(
                            text: defaultAddress.addressType.toString(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
