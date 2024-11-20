import 'package:flutter/material.dart';
import 'package:tourist_visit_place/profile/profile_screen.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';
//import 'package:tourist_visit_place/profile/profile_screen.dart';
//import 'package:tourist_visit_place/screens/home_screen.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF4093CE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 240),
              child: Padding(
                padding: EdgeInsets.only(top: 350),
                child: Text(
                  'Congrates!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF35BB2A),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Padding(
                padding: EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Text(
                      'Successfully Registered!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Color(
                        0xFFFFFFFF,
                      ),
                      size: 50,
                    ),
                  ],
                ),
              ),
            ),

            //_____________________________SizedBox Section for Space_____________________________________________________
            const SizedBox(
              height: 342,
            ),
            //_______________________________Home, Search and Profile Section______________________________________
            Container(
              width: 400,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFEEF3FC),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //-----------------Home Section----------------------
                  MaterialButton(
                    minWidth: 40,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: Color(0xFF80869A),
                        ),
                        Text(
                          'home',
                          style: TextStyle(
                            color: Color(0xFF80869A),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //_____________________________________SizedBox for Space________________________________________________
                  const SizedBox(
                    width: 60,
                  ),
                  //------------------Search Section-----------------------
                  MaterialButton(
                    minWidth: 40,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xFF80869A),
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Color(0xFF80869A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //_____________________________________SizedBox for Space________________________________________________
                  const SizedBox(
                    width: 60,
                  ),
                  //------------------------Profile Section-----------------------------
                  MaterialButton(
                    minWidth: 40,
                    height: 40,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color(0xFFF54749),
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Color(0xFFF54749),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
