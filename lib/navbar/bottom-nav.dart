import 'package:e_car/Home/home.dart';
import 'package:e_car/map/maps.dart';
import 'package:e_car/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0; // Home in the middle

  final List<Widget> _pages = const [
    HomeScreen(),
    ChargingStationsMap(),
    HomeScreen(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 30.0,
          items: [
            _buildNavBarItem(Icons.home, "home", 0),
            _buildNavBarItem(Icons.dashboard, "Categories", 1),
            _buildNavBarItem(Icons.person, "Profile", 2),
            _buildNavBarItem(Icons.person, "Profile", 3),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(205, 67, 67, 67),
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  /// ✅ Custom Navigation Bar Item with Circular White Background Effect
  BottomNavigationBarItem _buildNavBarItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0.0,
        ), // Adds space below icon
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: _selectedIndex == index ? 55 : 45,
          height: _selectedIndex == index ? 50 : 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _selectedIndex == index ? Colors.white : Colors.transparent,
          ),
          child: Icon(
            icon,
            size: _selectedIndex == index ? 35 : 30,
            color:
                _selectedIndex == index
                    ? const Color.fromARGB(255, 36, 36, 36)
                    : const Color.fromARGB(221, 115, 115, 115),
          ),
        ),
      ),
      label: label,
    );
  }
}
