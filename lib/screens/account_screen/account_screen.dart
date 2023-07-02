import 'package:dfcart/config/config.dart';
import 'package:dfcart/screens/account_screen/profile_screen.dart';
import 'package:dfcart/screens/auth_screen/auth_screen.dart';
import 'package:dfcart/screens/auth_screen/login_screen.dart';
import 'package:dfcart/screens/order_list_screen/order_list_screen.dart';
import 'package:dfcart/utils/routes.dart';
import 'package:dfcart/widgets/account_screen_widgets/icon_button_widget.dart';
import 'package:dfcart/widgets/drawer.dart';
import 'package:get/get.dart';
import '../auth_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../config/personalize.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: primaryColor, // Set your desired icon color here
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(profileImage),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      profileName,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      profileEmail,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, OrderListScreenRoute);
                            },
                            child: const IconButtonWidget(
                              image: orderIcon,
                              label: "Orders",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, ProfileScreenRoute);
                            },
                            child: const IconButtonWidget(
                              image: profileIcon,
                              label: "Profile",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const IconButtonWidget(
                              image: locationIcon,
                              label: "Address",
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const IconButtonWidget(
                              image: messageIcon,
                              label: "Messages",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: primaryColor,
                      ),
                      title: Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  //Change Password
                  InkWell(
                    onTap: () {},
                    child: const ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: primaryColor,
                      ),
                      title: Text(
                        "Change Password",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  //Settings
                  InkWell(
                    onTap: () {},
                    child: const ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: primaryColor,
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  //Help
                  InkWell(
                    onTap: () {},
                    child: const ListTile(
                      leading: Icon(
                        Icons.help,
                        color: primaryColor,
                      ),
                      title: Text(
                        "Help",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}
