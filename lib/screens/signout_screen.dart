import 'package:flutter/material.dart';
import 'package:tourist_visit_place/screens/sign_in_screen.dart';
// Import your SignInScreen here

class SignoutScreen extends StatelessWidget {
   const SignoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the SignInScreen after a delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  const SignInScreen(),
        ),
      );
    });

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4093CE),
              Color(0xFF4093CE),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 350),
                  child: Text(
                    "LogOut Successfully!",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(
                    Icons.check_circle,
                    color: Color(0xFFFFFFFF),
                    size: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
