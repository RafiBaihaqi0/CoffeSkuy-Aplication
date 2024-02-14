import 'package:flutter/material.dart';
import 'package:coffeskuyapp/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffeskuyapp/pages/register_screen.dart';

Color mainColor = const Color(0x402625);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  loginSubmit() async {
  try {
    final user = await _firebaseAuth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  } catch (e) {
    print(e);
    SnackBar(
        content: const Text('Invalid Email and Password'),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            //some code to undo the change
          },
        ),
      );
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
              left: 25.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style:TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 32),
                  ),
                  Text(
                    "Log in to your existant account of CoffeSkuy",
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
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
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
                      validator: (value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid password';
                        }
                        return null;
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
                      onPressed: () async{
                       loginSubmit();
                      },
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

