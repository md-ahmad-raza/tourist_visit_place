import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tourist_visit_place/profile/profile_screen.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String username = '';
  String email = '';
  String phoneNumber = 'isjdfidjfgik';
  bool isLoading = true; // Flag to track loading state

  TextEditingController nametext = TextEditingController();
  TextEditingController emailtext = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _saveChanges();
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
            isLoading = false; // Data fetched, stop loading
            phoneNumber = userDoc['password'] ?? 'No password';
            // Update the controllers with the fetched data
            nametext.text = username;
            emailtext.text = email;
            phonenumber.text = phoneNumber;
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

  Future<void> _saveChanges() async {
    if (_formKey.currentState?.validate() ?? false) {
      User? user = _auth.currentUser;

      if (user != null) {
        try {
          // Collect updated values
          String newUsername = nametext.text.trim();
          String newEmail = emailtext.text.trim();
          String newPhoneNumber = phonenumber.text.trim();

          // Update Firestore if any values have changed
          Map<String, dynamic> updatedData = {};
          if (newUsername != username) {
            updatedData['username'] = newUsername;
          }
          if (newEmail != email) {
            updatedData['email'] = newEmail;
          }
          if (newPhoneNumber != phoneNumber) {
            updatedData['password'] = newPhoneNumber;
          }

          if (updatedData.isNotEmpty) {
            // Update Firestore document
            await _firestore
                .collection('users')
                .doc(user.uid)
                .update(updatedData);
          }

          // Update Firebase Authentication if email is changed
          if (newEmail != email) {
            await user.updateEmail(newEmail);
          }

          // Update Firebase Authentication if password is changed
          if (phonenumber.text.isNotEmpty && newPhoneNumber != phoneNumber) {
            // Assuming you want to change password as part of phone number field
            // Firebase Auth requires current password to update
            // You can request current password to be entered in your form
            await user.updatePassword(
                newPhoneNumber); // Example using password as phone number
          }

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile updated successfully')),
          );
        } catch (e) {
          // Handle error
          print("Error updating user data: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error updating profile')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Allow UI to resize when keyboard appears
      body: SingleChildScrollView(
        // Make the content scrollable
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey, // Key for the form
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfileScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Edit Your Profile',
                            style: TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        // Profile Picture Container
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  AssetImage('lib/assets/images/profile.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // Edit Icon Positioned
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Color(0xFF80869A),
                              ),
                              onPressed: () {
                                // Add your edit functionality here
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 42),

                    // Name TextField Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: nametext,
                        decoration: InputDecoration(
                          labelText: 'Name:',
                          labelStyle: const TextStyle(
                            color: Color(0xFF4093CE),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFF4093CE),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 42),

                    // Email TextField Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: emailtext,
                        decoration: InputDecoration(
                          labelText: 'Email:',
                          labelStyle: const TextStyle(
                            color: Color(0xFF4093CE),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFF4093CE),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 42),

                    // Phone Number TextField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        controller: phonenumber,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            color: Color(0xFF4093CE),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              color: Color(0xFF4093CE),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }

                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 42),

                    // Save Elevated Button Section
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 45),
                        backgroundColor: const Color(0xFF2F7694),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Perform save action
                          _saveChanges();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Profile updated successfully')),
                          );
                        }
                      },
                      child: const Text(
                        'SAVE CHANGE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Footer Section
            const SizedBox(height: 220),
            Container(
              width: 500,
              height: 60,
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
                  // Home Section
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
                          'Home',
                          style: TextStyle(
                            color: Color(0xFF80869A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  // Search Section
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 60),
                  // Profile Section
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
