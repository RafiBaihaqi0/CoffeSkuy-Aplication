import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:coffeskuyapp/pages/login_screen.dart';
import 'package:get/get.dart';



Color mainColor = const Color(0x402625);

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  registerSubmit() async {
  try {
    final user = await _firebaseAuth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  } catch (e) {
    print(e);
    SnackBar(content: Text(e.toString()));
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 44,
                    width: 274,                    
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.person),                        
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10
                  ),
                  Container(
                    height: 44,
                    width: 274,                    
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.lock),                        
                      ),
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
                      onPressed: () async{
                        registerSubmit();
                      },
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

