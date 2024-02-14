import 'package:flutter/material.dart';
import 'package:coffeskuyapp/pages/account_pages/components/profile_menu.dart';
import 'package:coffeskuyapp/pages/account_pages/components/profile_pic.dart';
import 'package:get/get.dart';
import 'package:coffeskuyapp/routes/route_name.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null){
      print(auth.currentUser!.email);
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/img/login_top.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const ProfilePic(),
                Positioned(
                  bottom: 24,
                  child: Text.rich(
                    TextSpan(
                      text: auth.currentUser!.email, // Ganti dengan nama yang sesuai
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "My Account",
              iconData: Icons.account_circle,
              press: () => {},
            ),
            ProfileMenu(
              text: "Notifications",
              iconData: Icons.notifications,
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              iconData: Icons.settings,
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              iconData: Icons.help,
              press: () {},
            ),
            Container(
              height: 44,
              width: 120,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 50, 50),
                border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                Get.toNamed(RouteName.login_screen);
              },                  
              style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: const Color.fromARGB(0, 251, 251, 251)),
                child: Text(
                  "Logout",
                  style: GoogleFonts.jaldi(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.home_screen);
              },
              style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent, foregroundColor: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    color:  Colors.grey,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ) ,
              ),
              ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.data_screen);
              },
              style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent, foregroundColor: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.coffee,
                    color:  Colors.grey,
                  ),
                  Text(
                    'Caffe',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ) ,
              ),
              ElevatedButton(
              onPressed: () {
                Get.toNamed(RouteName.profile_screen);
              },
              style: ElevatedButton.styleFrom(elevation: 0,backgroundColor: Colors.transparent, foregroundColor: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color:  Colors.brown,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ],
              ) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
