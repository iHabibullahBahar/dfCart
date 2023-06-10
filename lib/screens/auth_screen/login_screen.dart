import '../../config/config.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        //backgroundColor: primaryColor,
        backgroundColor: Color(0xFFFFFF),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(
                    height: 150,
                  ),
                  SizedBox(
                    height: 100,
                    child:Image(image: AssetImage(logo),)
                  ),
                  SizedBox(height: 200,),
                  //Login Text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(
                      child:Text("Register or login with Mobile Number",style:TextStyle(color:Color(0xFF434343)))
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: (){
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF54AFBC)
                          ),
                          elevation: MaterialStateProperty.all(0),
                        ),

                        child: Row(
                          children: [
                            Text("+880",style: TextStyle(color: Colors.white),),
                            Text("   Enter your mobile number",style: TextStyle(color: Colors.white38),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  //or login with text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1, // Set the desired height of the divider
                            color: textColors, // Set the desired color of the divider
                            margin: EdgeInsets.symmetric(horizontal: 8), // Set the desired horizontal margin
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                          child: Text('Or continue with',style: TextStyle(color:textColors),),
                        ),
                        Expanded(
                          child: Container(
                            height: 1, // Set the desired height of the divider
                            color: textColors, // Set the desired color of the divider
                            margin: EdgeInsets.symmetric(horizontal: 8), // Set the desired horizontal margin
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  //Google Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(onPressed: (){}, child: Image(image: AssetImage(googleLogo),),style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent
                            ),
                            elevation: MaterialStateProperty.all(0),
                          ),),
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(onPressed: (){}, child: Image(image: AssetImage(facebookLogo),),style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent
                            ),
                            elevation: MaterialStateProperty.all(0),
                          ),),
                        ),
                      ],
                    ),
                  ),
                ]
            ),

          ),
        )
    );
  }
}
