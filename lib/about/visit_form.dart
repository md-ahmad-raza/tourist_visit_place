import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourist_visit_place/about/confirmation_screen.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';

class VisitForm extends StatefulWidget {
  const VisitForm({super.key});

  @override
  State<VisitForm> createState() => _VisitFormState();
}

class _VisitFormState extends State<VisitForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Method to add form data to Firestore
  Future<void> _registerVisit() async {
    try {
      await FirebaseFirestore.instance.collection('visit_forms').add({
        'name': _nameController.text,
        'address': _addressController.text,
        'phone': _phoneController.text,
        'created_at': FieldValue.serverTimestamp(),
      });

      // Navigate to ConfirmationScreen upon successful submission
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmationScreen()),
      );
    } catch (e) {
      print('Failed to add visit: $e');
      // Optionally, show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register visit: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFF4093CE),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 300),
              child: MaterialButton(
                minWidth: 30,
                height: 20,
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            //----------------------- Visit Form Title --------------------------------------
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 150),
              child: Row(
                children: [
                  Text(
                    'Visit Form',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            //--------------------Form Container-------------------------
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFDF8F8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //---------------------------Name Field------------------------------------
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Name:",
                        labelStyle: const TextStyle(
                          color: Color(0xFF4093CE),
                        ),
                        hintText: "Enter your Name",
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
                    ),
                    const SizedBox(height: 20),
                    //---------------------------Address Field---------------------------------
                    TextField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: "Address:",
                        labelStyle: const TextStyle(
                          color: Color(0xFF4093CE),
                        ),
                        hintText: "Enter your Address",
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
                    ),
                    const SizedBox(height: 20),
                    //---------------------------Phone Number Field----------------------------
                    TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: "Phone Number:",
                        labelStyle: const TextStyle(
                          color: Color(0xFF4093CE),
                        ),
                        hintText: "**********",
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
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 30),
                    //---------------------------Register Button-------------------------------
                    ElevatedButton(
                      onPressed:
                          _registerVisit, // Call the registration function
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F7694),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'REGISTER',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
