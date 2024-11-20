import 'package:flutter/material.dart';
import 'package:tourist_visit_place/screens/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF4093CE),
          Color(0xFF4093CE),
        ])),
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset('lib/assets/images/logo.png')],
              ),
              //sizedBox for width
              const SizedBox(
                height: 50,
              ),
              //sizedBox width section end
              const SizedBox(
                width: 230,
//_________________________________________Text Section-1__________________________________________________________________
                child: Text(
                  "Let's Enjoy Together With Your Family & Friends!",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              //sizedBox for width
              const SizedBox(
                height: 40,
              ),
//_________________________________________Text Section-2__________________________________________________________________
              const Text(
                ('Choose Your Favorite Places'),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //sizedBox for width
              const SizedBox(
                height: 30,
              ),
              //-----------------Elevated Button Section-----------------
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F7694),
                  minimumSize: const Size(250, 45),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
