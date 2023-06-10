import '../../config/config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  SizedBox(height: 20,),
                  Text('Login',style: TextStyle(fontSize: 30),),
                  SizedBox(height: 20,),

                  //Email Address TextField
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address'
                        ),
                      ),
                    ),
                  ),
                  //Password TextField
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),

                  //Forgot Password Text Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Spacer(),
                        InkWell(
                          onTap: (){
                            //Navigator.pushNamed(context, '/forgotPassword');
                          },
                          child: Text('Forgot Password?'),
                        ),
                      ],
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
                          //Navigator.pushNamed(context, '/home');
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              primaryColor
                          ),
                          elevation: MaterialStateProperty.all(0),
                        ),

                        child: Text('Login'),
                      ),
                    ),
                  ),
                  SizedBox(height: 120,),
                  //or login with text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 1, // Set the desired height of the divider
                            color: Colors.grey, // Set the desired color of the divider
                            margin: EdgeInsets.symmetric(horizontal: 8), // Set the desired horizontal margin
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,),
                          child: Text('Or login with'),
                        ),
                        Expanded(
                          child: Container(
                            height: 1, // Set the desired height of the divider
                            color: Colors.grey, // Set the desired color of the divider
                            margin: EdgeInsets.symmetric(horizontal: 8), // Set the desired horizontal margin
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  //Google Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: (){
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    primaryColor
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: (){
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      primaryColor
                                  ),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                child: Icon(Icons.g_mobiledata_sharp),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: (){
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    primaryColor
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: Icon(Icons.facebook),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  //SizedBox(height: 100,),

                  //Don't have an account? Sign Up Text Button
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          InkWell(
                            onTap: (){
                              //Navigator.pushNamed(context, '/signUp');
                            },
                            child: Text(' Sign Up',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,),),
                  )
                        ],
                      ),
                    ),
                  ),
                ]
            ),

          ),
        )
    );
  }
}
