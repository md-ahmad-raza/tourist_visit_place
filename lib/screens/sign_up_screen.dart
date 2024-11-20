import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourist_visit_place/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TextEditing controllers for text input fields
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();

  // A bool variable to show and hide password
  bool isVisible = false;

  // Global key for the form
  final formkey = GlobalKey<FormState>();

  // Firebase Authentication and Firestore instances
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to sign up using Firebase Auth and store details in Firestore
  Future<void> signUp() async {
    if (formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );

        // Update display name with username
        await userCredential.user!.updateDisplayName(username.text.trim());

        // Add user details to Firestore with the generated UID
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username.text.trim(),
          'email': email.text.trim(),
          'password': password.text.trim(),
          'created_at': Timestamp.now(),
          'uid': userCredential.user!.uid, // Automatically use the UID
        });

        // Show success message and navigate to SignInScreen
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign up successful! Please log in.')),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage;

        // Firebase-specific error handling
        if (e.code == 'weak-password') {
          errorMessage = 'The password is too weak.';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'An account already exists for this email.';
        } else {
          errorMessage = e.message!;
        }

        // Display error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Screen'),
        backgroundColor: Colors.lightBlue,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                    ),
                  ),
                ),
                // UserName TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Username is required";
                            }
                            return null;
                          },
                          controller: username,
                          decoration: InputDecoration(
                            labelText: " UserName:",
                            labelStyle:
                                const TextStyle(color: Color(0xFF4093CE)),
                            hintText: " Enter username here",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                color: Color(0xFF4093CE),
                              ),
                            ),
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Color(0xFF4093CE),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Email TextField
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                          controller: email,
                          decoration: InputDecoration(
                            labelText: "Email:",
                            labelStyle:
                                const TextStyle(color: Color(0xFF4093CE)),
                            hintText: "abc@gmail.com",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xFF4093CE),
                              ),
                            ),
                            suffixIcon: const Icon(
                              Icons.email,
                              color: Color(0xFF4093CE),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Password TextField
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          controller: password,
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            labelText: 'Password:',
                            labelStyle:
                                const TextStyle(color: Color(0xFF4093CE)),
                            hintText: '**************',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Color(0xFF4093CE)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: const Color(0xFF4093CE),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Confirm Password TextField
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirm password is required";
                            } else if (value != password.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          controller: cpassword,
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password:',
                            labelStyle:
                                const TextStyle(color: Color(0xFF4093CE)),
                            hintText: '**************',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Color(0xFF4093CE)),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: const Color(0xFF4093CE),
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // SignUp Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F7694),
                            minimumSize: const Size(250, 45),
                          ),
                          onPressed: signUp,
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // SignIn Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  const SignInScreen(),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 40),
                                child: Text(
                                  'LogIn',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
