import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_visit_place/profile/edit_profile_screen.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';
import 'package:tourist_visit_place/screens/sign_in_screen.dart';
import 'package:tourist_visit_place/screens/signout_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String username = '';
  String email = '';
  String phoneNumber = '';
  bool isLoading = true; // Flag to track loading state

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      // Get the currently logged-in user
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        // Check if document exists
        if (userDoc.exists) {
          setState(() {
            username = userDoc['username'] ?? 'No username';
            email = userDoc['email'] ?? 'No email';
            phoneNumber = userDoc['phoneNumber'] ?? 'No phone number';
            isLoading = false; // Data fetched, stop loading
          });
        }
      }
    } catch (e) {
      // Handle error
      print("Error fetching user data: $e");
      setState(() {
        isLoading = false; // In case of error, stop loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading spinner
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
//______________________________________________________________Profile Section___________________________________________________________
                    Container(
                      width: 350,
                      height: 245,
                      color: const Color(0xFF4093CE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //-----------------Profile Text-Name Section----------------------
                          const Padding(
                            padding: EdgeInsets.only(right: 250),
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
//______________________________________________________________Card Name-Icon Section_________________________________________________
                          SizedBox(
                            width: 364,
                            height: 99,
                            child: Card(
                              child: Row(
                                children: [
                                  //-----------------Card-Image Section----------------------
                                  const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'lib/assets/images/profile.png'),
                                    ),
                                  ),
                                  //-----------------Card-Name Section----------------------
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Row(
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                    username), // Display actual username
                                                Text(
                                                    email), // Display actual email
                                              ],
                                            ),
                                            //-----------------Card-Icon Section----------------------
                                            IconButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const EditProfileScreen(),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.edit,
                                                // ignore: use_full_hex_values_for_flutter_colors
                                                color: Color(0xfff80869a),
                                              ),
                                            ),
                                            //-----------------Card-Icon Section-End----------------------
                                          ],
                                        ),
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Row(
                          //-----------------Home-Button Section----------------------
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.home),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text('Home'),
                                  ),
                                ],
                              ),
                            ),
                            //_____________________________________SizedBox for Space________________________________________________
                            const SizedBox(
                              width: 150,
                            ),
                            //-----------------Home Arrow Icont-Button Section----------------------
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
                              child: const Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ],
                        ),
                        //-----------------Logout Section----------------------
                        Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignInScreen(),
                                  ),
                                );
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.logout_rounded),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text('Logout'),
                                  ),
                                ],
                              ),
                            ),
                            //_____________________________________SizedBox for Space________________________________________________
                            const SizedBox(
                              width: 150,
                            ),
                            //-----------------Logout Arrow-Icon Section----------------------
                            MaterialButton(
                              minWidth: 40,
                              height: 40,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignoutScreen(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.arrow_forward_ios_sharp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 140,
                ),
                //_______________________________Home, Search and Profile Section______________________________________
                Padding(
                  padding: const EdgeInsets.only(top: 290),
                  child: Container(
                    width: 400,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
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
                ),
              ],
            ),
    );
  }
}
