import '../../config/config.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image(image: AssetImage(logo),),
              SizedBox(height: 20,),


            ]
          ),
        ),
      )
    );
  }
}
