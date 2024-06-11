import 'package:coffeskuyapp/pages/home_screen.dart';
import 'package:coffeskuyapp/services/auth_services.dart';
import 'package:coffeskuyapp/services/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:coffeskuyapp/pages/login_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Color mainColor = const Color(0x402625);

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {

  String _name = '';
  String _email = '';
  String _password = '';


  createAccountPressed() async{
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(_email);
    if(emailValid){
      http.Response response = await AuthServices.register(_name, _email, _password);
      Map responseMap = jsonDecode(response.body);
      print(response.statusCode);
      if (response.statusCode==200){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
        ));
      }else{
        errorSnackBar(context, responseMap.values.first[0]);
      }
    }else{
      errorSnackBar(context, 'email not valid');
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
              left: 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Let’s Get Started",
                    style:TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 32),
                  ),
                  Text(
                    "Create an Account to Get All Features",
                    style:TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
                  )
                ],
              ),
            ),
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
                        labelText: 'Username',
                        hintText: 'Enter your Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.person),                        
                      ),
                      onChanged: (value) {
                        setState(() {
                            _name = value;
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
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
                    height: 10
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
                      onPressed: () => createAccountPressed(),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0xffffffff), fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an Account'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginScreen())
                        );
                        },
                        child: Text('Login'),
                      ),
                    ],
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

