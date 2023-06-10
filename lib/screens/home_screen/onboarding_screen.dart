import 'home_screen.dart';

import '../../config/config.dart';

import '../account_screen/account_screen.dart';
import '../wishlist_screen/wishlist_screen.dart';
import '../cart_screen/cart_screen.dart';

import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: _selectedIndex,
          children:const [
            HomeScreen(),
            CartScreen(),
            WishlistScreen(),
            AccountScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items:  const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),

                label:"Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2),
              label: "Account",
            ),

          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: textColors,
          unselectedLabelStyle: const TextStyle(color: textColors),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}