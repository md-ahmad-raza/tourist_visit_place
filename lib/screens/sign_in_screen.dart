import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';
import 'package:tourist_visit_place/screens/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TextEditing controllers for text input fields
  final email = TextEditingController();
  final password = TextEditingController();

  // A bool variable to show and hide password
  bool isVisible = false;

  // Global key for the form
  final formkey = GlobalKey<FormState>();

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Key for SharedPreferences login state
  static const String keyLogin = "isLoggedIn";

  // SignIn method with Firebase Authentication
  Future<void> signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (userCredential.user != null) {
        // Store login state in SharedPreferences
        var sharedpref = await SharedPreferences.getInstance();
        await sharedpref.setBool(keyLogin, true);

        // Navigate to HomeScreen on successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? "Error during sign-in");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn Screen'),
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
                    'Log In',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
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
                              borderSide:
                                  const BorderSide(color: Color(0xFF4093CE)),
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
                        // SignIn Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2F7694),
                              minimumSize: const Size(250, 45)),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              signIn(); // Call sign-in method
                            }

                            //successfully logged In (creds are correct)
                            // var sharedpref =await SharedPreferences.getInstance();
                            //     sharedpref.setBool(keyLogin, true);
                          },
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(color: Color(0xFFFFFFFF)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // SignIn Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
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
