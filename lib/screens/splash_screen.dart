import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:tourist_visit_place/screens/home_screen.dart';
//import 'package:tourist_visit_place/screens/sign_in_screen.dart';
import 'package:tourist_visit_place/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
    });
  }
  //static const String keyLogin = "Login";

  // @override
  // void initState() {
  //   super.initState();
  //   whereToGo();
  // }

  // Future<void> whereToGo() async {
  //   // Access SharedPreferences
  //   var sharedPref = await SharedPreferences.getInstance();
  //   var isLoggedIn = sharedPref.getBool(keyLogin) ?? false;

  //   // Delay for 3 seconds, then navigate based on login state
  //   Timer(const Duration(seconds: 3), () {
  //     if (isLoggedIn) {
  //       // Navigate to HomeScreen if user is logged in
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => SignInScreen()),
  //       );
  //     } else {
  //       // Navigate to SignInScreen if user is not logged in
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) =>const HomeScreen()),
  //       );
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Tourist Visit Places',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
