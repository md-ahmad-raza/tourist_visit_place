import 'package:flutter/material.dart';
import 'package:tourist_visit_place/about/about_lalkila.dart';
import 'package:tourist_visit_place/about/about_mount_everest.dart';
import 'package:tourist_visit_place/about/about_tajmahal.dart';
import 'package:tourist_visit_place/profile/profile_screen.dart';
import 'package:tourist_visit_place/screens/tourist_place_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Index to keep track of the selected tab
  int _selectedIndex = 0;

  // List of tourist places
  List<Map<String, String>> places = [
    {
      'name': 'Mount Everest',
      'image': 'lib/assets/images/mountain.png',
      'price': 'Rs.500'
    },
    {
      'name': 'Taj Mahal',
      'image': 'lib/assets/images/tajmahal.png',
      'price': 'Rs.700'
    },
    {
      'name': 'Lal Kila',
      'image': 'lib/assets/images/lalkila.png',
      'price': 'Rs.300'
    },
  ];

  // List of filtered places (used to store the results based on search query)
  List<Map<String, String>> filteredPlaces = [];

  // TextEditingController for the search bar
  TextEditingController searchController = TextEditingController();

  // Function to filter the places based on the search query
  void filterPlaces(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPlaces = places; // Show all places when query is empty
      } else {
        filteredPlaces = places
            .where((place) =>
                place['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredPlaces = places; // Initialize with all places
    searchController.addListener(() {
      filterPlaces(searchController.text); // Filter based on the search input
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ensures the body resizes when the keyboard appears
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4093CE),
              Color(0xFF9BCEF3),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80), // Space for bottom nav
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User greeting and profile icon
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('lib/assets/images/user.png'),
                        width: 40,
                        height: 40,
                      ),
                      Text(
                        "Hi Ahmadi!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .white, // Ensure text is visible on gradient
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.notifications,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Search bar
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Where You Want To Go?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Ensure text is visible on gradient
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search Your Places",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none, // Remove border lines
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Popular places section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Popular Places",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors
                              .white, // Ensure text is visible on gradient
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // View all logic
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TouristPlaceList(),
                            ),
                          );
                        },
                        child: const Text(
                          "View all",
                          style: TextStyle(
                            color: Color(0xFFBB611F), // Match the theme
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Display the filtered places based on the search query
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: filteredPlaces.map((place) {
                      return MaterialButton(
                        minWidth: 90,
                        height: 160,
                        onPressed: () {
                          if (place['name'] == 'Mount Everest') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutMountEverest(),
                              ),
                            );
                          } else if (place['name'] == 'Taj Mahal') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutTajmahal(),
                              ),
                            );
                          } else if (place['name'] == 'Lal Kila') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutLalkila(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.asset(place['image']!),
                              Column(
                                children: [
                                  Text(
                                    place['name']!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    place['price']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFBB611F),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFEEF3FC),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Home Section
            GestureDetector(
              onTap: () {
                _onItemTapped(0);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home,
                    color: _selectedIndex == 0
                        ? Colors.blue
                        : const Color(0xFF80869A),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: _selectedIndex == 0
                          ? Colors.blue
                          : const Color(0xFF80869A),
                    ),
                  ),
                ],
              ),
            ),

            // Search Section
            GestureDetector(
              onTap: () {
                _onItemTapped(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.search,
                    color: _selectedIndex == 1
                        ? Colors.blue
                        : const Color(0xFF80869A),
                  ),
                  Text(
                    'Search',
                    style: TextStyle(
                      color: _selectedIndex == 1
                          ? Colors.blue
                          : const Color(0xFF80869A),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Section
            GestureDetector(
              onTap: () {
                _onItemTapped(2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person,
                    color: _selectedIndex == 2
                        ? Colors.red
                        : const Color(0xFF80869A),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: _selectedIndex == 2
                          ? Colors.red
                          : const Color(0xFF80869A),
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
