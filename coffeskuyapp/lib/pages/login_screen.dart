import 'dart:convert';

import 'package:coffeskuyapp/services/auth_services.dart';
import 'package:coffeskuyapp/services/globals.dart';
import 'package:flutter/material.dart';
import 'package:coffeskuyapp/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffeskuyapp/pages/register_screen.dart';
import 'package:http/http.dart' as http;

Color mainColor = const Color(0x402625);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Color _emailBorderColor = Colors.grey;
  Color _passwordBorderColor = Colors.grey;
  String _email = '';
  String _password = '';

  loginAccoutPressed() async{
    if(_email.isNotEmpty && _password.isNotEmpty){
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if(response.statusCode==200){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
        ));
      }else{
        errorSnackBar(context, responseMap.values.first);
      }
    }else{
      errorSnackBar(context, 'enter all required fields');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Stack(
          children: [
            Image.asset("assets/img/login_top.png"),
            Positioned(
              top: 60.0,
              left: 70.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style:TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 32),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Login into your CoffeSkuy Account",
                    style:TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
            ), // INI RUSAK UBAH NTAR
            Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Center(
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          "assets/img/logo_blk2.png",
                          height: 170,
                          width: 176,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 44,
                    width: 274,                    
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: _emailBorderColor),
                        ),
                        prefixIcon: Icon(Icons.person),                        
                      ),
                      onChanged: (value) {
                        setState(() {
                            _email = value;
                          });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 44,
                    width: 274,                    
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: _passwordBorderColor),
                        ),
                        prefixIcon: Icon(Icons.lock),                        
                      ),
                      onChanged: (value) {
                        setState(() {
                            _password = value;
                          });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 44,
                    width: 274,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      border: Border.all(color: Color(0xff475BD8)),
                      borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: ()=> loginAccoutPressed(),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xffffffff), fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont Have an Account'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => RegisterScreen())
                        );
                        },
                        child: Text('Register'),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Forget Password'),
                      ),
                    ],
                    ),
                  ),               
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

