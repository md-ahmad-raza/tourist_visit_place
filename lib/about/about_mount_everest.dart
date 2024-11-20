import 'package:flutter/material.dart';
import 'package:tourist_visit_place/about/visit_form.dart';
import 'package:tourist_visit_place/profile/profile_screen.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';

class AboutMountEverest extends StatefulWidget {
  const AboutMountEverest({super.key});

  @override
  State<AboutMountEverest> createState() => _AboutMountEverestState();
}

class _AboutMountEverestState extends State<AboutMountEverest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Added SingleChildScrollView
        child: Container(
          width: double.infinity,
          color: const Color(0xFF4093CE),
          child: Column(
            children: [
//________________________________Back Material Button Section___________________________________________________________
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Padding(
                  padding: const EdgeInsets.only(right: 300),
                  child: MaterialButton(
                    minWidth: 20,
                    height: 30,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ),
//____________________________________Image Section_______________________________________________
              Image.asset('lib/assets/images/Mountain1.png'),
//_____________________________________Image Name Section_________________________________________________________
              const Padding(
                padding: EdgeInsets.only(right: 230),
                child: Text(
                  'Mount Everest',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 250),
                child: Text(
                  'Kathmandu',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBB1F1F),
                  ),
                ),
              ),
//__________________________________About Section__________________________________________________________
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              const SizedBox(
                width: 350,
                child: Text(
                  'Mount Everest was first identified as the highest peak in 1852, one of the most iconic mountains on earth. Mount Everest is a magnificent tourist attraction in Asia, with at least 35,000 tourists flocking it every year, as per the Washington Post. That said, here is a look at other 50 interesting facts about Mount Everest.',
                  style: TextStyle(
                    color: Color(0xFFBBBBBB),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Text(
                            'Price ',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Rs.100',
                              style: TextStyle(color: Color(0xFFBB1F1F)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 100),
                    MaterialButton(
                      color: const Color(0xFF2F7694),
                      minWidth: 190,
                      height: 30,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VisitForm(),
                          ),
                        );
                      },
                      child: const Row(
                        children: [
                          Text(
                            'Visit Now',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_right,
                            color: Color(0xFFFFFFFF),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ---------------------------------------------------------------------
              const SizedBox(
                height: 260,
              ),
              Container(
                width: 400,
                height: 50,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEF3FC),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 30,
                      height: 30,
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
                    const SizedBox(width: 30),
                    MaterialButton(
                      minWidth: 30,
                      height: 30,
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
                    const SizedBox(width: 40),
                    MaterialButton(
                      minWidth: 20,
                      height: 20,
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
                            color: Color(0xFFBB1F1F),
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: Color(0xFFBB1F1F),
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
      ),
    );
  }
}
