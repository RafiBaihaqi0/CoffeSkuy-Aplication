import 'package:flutter/material.dart';
import 'package:coffeskuyapp/pages/account_pages/components/profile_menu.dart';
import 'package:coffeskuyapp/pages/account_pages/components/profile_pic.dart';
import 'package:get/get.dart';
import 'package:coffeskuyapp/routes/route_name.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeskuyapp/services/auth_services.dart'; // Import your updated AuthServices
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'User'; // State variable to hold username

  @override
  void initState() {
    super.initState();
    loadUsername(); // Load username when the screen initializes
  }

  Future<void> loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('name');
    if (storedUsername != null) {
      setState(() {
        username = storedUsername; // Set the username to display in the UI
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      text: username, // Display user's username
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                  // Example: Logout logic
                  AuthServices.logout(); // Call your logout method
                  Get.toNamed(RouteName.login_screen); // Navigate to login screen
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(0, 251, 251, 251),
                ),
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
    );
  }
}
