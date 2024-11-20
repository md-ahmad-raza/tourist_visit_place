import 'package:flutter/material.dart';
import 'package:tourist_visit_place/about/visit_form.dart';
import 'package:tourist_visit_place/profile/profile_screen.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';

//import 'package:tourist_visit_place/profile/profile_screen.dart';
//import 'package:tourist_visit_place/screens/home_screen.dart';

class AboutTajmahal extends StatefulWidget {
  const AboutTajmahal({super.key});

  @override
  State<AboutTajmahal> createState() => _AboutTajmahalState();
}

class _AboutTajmahalState extends State<AboutTajmahal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
            Image.asset('lib/assets/images/TajMahal1.png'),
//_____________________________________Image Name Secton_________________________________________________________
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'TajMahal',
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
                'Agra',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBB1F1F),
                ),
              ),
            ),
//__________________________________About Secton__________________________________________________________
            const Text(
              'About',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              width: 350,
              child: Text(
                'The shimmering white marble used in the construction of the Taj Mahal changes color according to the time of day — from the uplifting yellow of sunrise to the desolate deep blue of night. People have imagined poetically that the color changes reflect the feelings the late emperor underwent during his time with Mumtaz Mahal and after her death.',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFBBBBBB),
                ),
              ),
            ),
//__________________________________Text Price Section____________________________________________________________________
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Price ',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Rs.700',
                          style: TextStyle(
                            color: Color(0xFFBB1F1F),
                          ),
                        ),
                      )
                    ],
                  ),
                  //_____________________________SizedBox Section for Space_____________________________________________________
                  const SizedBox(
                    width: 100,
                  ),
                  //______________________________Visit Now Material Button Section_____________________________________________
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
                  )
                ],
              ),
            ),
//_____________________________SizedBox Section for Space_____________________________________________________
            const SizedBox(
              height: 262,
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
                  //_____________________________________SizedBox for Space________________________________________________
                  const SizedBox(
                    width: 30,
                  ),
                  //------------------Search Section-----------------------
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
                      )),

                  //_____________________________________SizedBox for Space________________________________________________
                  const SizedBox(
                    width: 30,
                  ),
                  //------------------------Profile Section-----------------------------
                  MaterialButton(
                    minWidth: 30,
                    height: 30,
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
