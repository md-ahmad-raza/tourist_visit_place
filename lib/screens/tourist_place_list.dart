import 'package:flutter/material.dart';
import 'package:tourist_visit_place/profile/profile_screen.dart';
import 'package:tourist_visit_place/screens/home_screen.dart';

class TouristPlaceList extends StatefulWidget {
  const TouristPlaceList({super.key});

  @override
  State<TouristPlaceList> createState() => _TouristPlaceListState();
}

class _TouristPlaceListState extends State<TouristPlaceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background color Section Begin
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF4093CE),
            Color(0xFF9BCEF3),
          ]),
        ),
        // Background color Section end
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 10),
              child: Row(
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
                    color: const Color(0xFFFFFFFF),
                    minWidth: 20,
                    height: 30,
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ],
              ),
            ),
            const Text(
              'Tourist Place',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            ),
//_________________________________________WaterFall Section__________________________________________________________________
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Image.asset('lib/assets/images/waterfall.png'),
                          const Padding(
                            padding: EdgeInsets.only(right: 40),
                            child: Text(
                              'WaterFall',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 60),
                            child: Text(
                              'Rs. 120',
                              style: TextStyle(
                                fontSize: 7,
                                color: Color(0xFFBB611F),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
//_________________________________________SizedBox For Space__________________________________________________________________
                  const SizedBox(
                    width: 10,
                  ),
//_________________________________________Garden Section__________________________________________________________________
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/garden.png'),
                        const Padding(
                          padding: EdgeInsets.only(right: 50),
                          child: Text(
                            'Garden',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Text(
                            'Rs.100 ',
                            style: TextStyle(
                                fontSize: 7, color: Color(0xFFBB611F)),
                          ),
                        ),
                      ],
                    ),
                  ),
//_________________________________________SizedBox For Space__________________________________________________________________
                  const SizedBox(
                    width: 10,
                  ),
//_________________________________________Party Palace Section__________________________________________________________________
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/party palace.png'),
                        const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Text(
                            'Party Palace',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Text(
                            'Rs.150',
                            style: TextStyle(
                              fontSize: 7,
                              color: Color(0xFFBB611F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
//_________________________________________Umbrella Street Section__________________________________________________________________
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/umbrella.png'),
                        const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Text(
                            'Umbrella Street',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Text(
                            'Rs. 200',
                            style: TextStyle(
                              fontSize: 7,
                              color: Color(0xFFBB611F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//_________________________________________SizedBox For Space__________________________________________________________________
                  const SizedBox(
                    width: 10,
                  ),
//_________________________________________India Gate Section__________________________________________________________________
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/india gate.png'),
                        const Padding(
                          padding: EdgeInsets.only(right: 40),
                          child: Text(
                            'India Gate',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Text(
                            'Rs.50',
                            style: TextStyle(
                              fontSize: 7,
                              color: Color(0xFFBB611F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//_________________________________________SizedBox For Space__________________________________________________________________
                  const SizedBox(
                    width: 10,
                  ),
//_________________________________________Musium Section__________________________________________________________________
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/musium.png'),
                        const Padding(
                          padding: EdgeInsets.only(right: 45),
                          child: Text(
                            'Mesium',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Text(
                            'Rs.300',
                            style: TextStyle(
                              fontSize: 7,
                              color: Color(0xFFBB611F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
//_________________________________________Parsa National Park Section__________________________________________________________________
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/parsa.png'),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'Parsa, National Park',
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Text(
                            'Rs.800',
                            style: TextStyle(
                              fontSize: 7,
                              color: Color(0xFFBB611F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
//_________________________________________SizedBox For Space__________________________________________________________________
                  const SizedBox(
                    width: 10,
                  ),
//_________________________________________Chitwan National Park Section__________________________________________________________________
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/chitwan.png'),
                        const Text(
                          'Chitwan, Natoonal Park',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Text(
                            'Rs.1000',
                            style: TextStyle(
                              fontSize: 7,
                              color: Color(0xFFBB611F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
//_________________________________________sizedBox For Space__________________________________________________________________
                  const SizedBox(
                    width: 10,
                  ),
//_________________________________________Taj Majal Section__________________________________________________________________
                  Container(
                    width: 90,
                    height: 160,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.asset('lib/assets/images/tajmahal.png'),
                        const Text(
                          'Bardia, National Park',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        const Text(
                          'Rs.700',
                          style: TextStyle(
                            fontSize: 7,
                            color: Color(0xFFBB611F),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //_____________________________SizedBox Section for Space_____________________________________________________
            const SizedBox(
              height: 172,
            ),
//_______________________________Home, Search and Profile Section______________________________________
            Container(
              width: 400,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                              Icon(Icons.home),
                              Text('Home'),
                            ],
                          )),
                    ],
                  ),
                  //_____________________________________SizedBox for Space________________________________________________
                  const SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
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
                            children: [Icon(Icons.search), Text('Search')],
                          )),
                    ],
                  ),
                  //_____________________________________SizedBox for Space________________________________________________
                  const SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
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
                              )
                            ],
                          )),
                    ],
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
